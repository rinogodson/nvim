local function get_visual_selection()
  local _, srow, _, _ = unpack(vim.fn.getpos("'<"))
  local _, erow, _, _ = unpack(vim.fn.getpos("'>"))

  if srow == 0 or erow == 0 then
    return "", 0, 0
  end

  local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
  if #lines == 0 then
    return "", 0, 0
  end

  return table.concat(lines, "\n"), srow - 1, erow
end

vim.api.nvim_create_user_command("AskAI", function(opts)
  local current_filetype = vim.bo.filetype
  local selection, _, _ = get_visual_selection()

  if selection == "" then
    print("No selection found!")
    return
  end

  local prompt = opts.args
  if prompt == "" then
    prompt = "Improve this code"
  end

  print("Waiting for AI...")

  local payload = {
    model = "openai/gpt-oss-120b",
    messages = {
      {
        role = "system",
        content = "You are a coding assistant. Output ONLY the new code. No markdown code fences like ```lua. No conversational text.",
      },
      { role = "user", content = "Original Code:\n" .. selection .. "\n\nInstruction: " .. prompt },
    },
    stream = false,
    reasoning_effort = "high",
    temperature = 0.3,
  }

  local json_payload = vim.fn.json_encode(payload):gsub("'", "'\\''")

  local cmd = string.format(
    "curl -s https://api.groq.com/openai/v1/chat/completions "
      .. "-H 'Content-Type: application/json' "
      .. "-H 'Authorization: Bearer %s' "
      .. "-d '%s'",
    os.getenv("GROQ_API_KEY"),
    json_payload
  )

  local output_data = {}
  vim.fn.jobstart(cmd, {
    on_stdout = function(_, data, _)
      table.insert(output_data, data)
    end,

    on_exit = function(_, exit_code, _)
      if exit_code ~= 0 then
        print("Curl failed with code " .. exit_code)
        return
      end

      local response = table.concat(vim.tbl_flatten(output_data), "")
      if response == "" then
        return
      end

      local success, json = pcall(vim.json.decode, response)
      if not success then
        print("JSON Decode Failed." .. response)
        return
      end

      if json.error then
        print("API Error: " .. json.error.message)
        return
      end

      if not json.choices or not json.choices[1] then
        print("API said no!")
        return
      end

      local new_code = json.choices[1].message.content
      new_code = new_code:gsub("^```%w*\n", ""):gsub("\n```$", "")

      vim.schedule(function()
        vim.cmd("vnew")

        vim.cmd("wincmd L")

        local total_width = vim.o.columns
        local win_width = math.floor(total_width * 0.4)
        vim.api.nvim_win_set_width(0, win_width)

        local buf = vim.api.nvim_get_current_buf()
        local result_lines = vim.split(new_code, "\n")
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, result_lines)

        vim.bo[buf].filetype = current_filetype

        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].swapfile = false

        print("AI Slop is here!!")
      end)
    end,
  })
end, { range = true, nargs = "?" })

vim.keymap.set("v", "<leader>ai", ":AskAI ")
