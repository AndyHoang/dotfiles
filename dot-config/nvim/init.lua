vim.cmd([[

set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc

if !has('nvim')
    set ttymouse=xterm2
endif
let g:python3_host_prog = expand('~/.config/nvim/venv/bin/python')


]])

require('avante').setup{
  provider = "claude",
  auto_suggestions_provider = "claude",
  behaviour = {
    --auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
    enable_token_counting = true, -- Whether to enable token counting. Default to true.
    enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
    enable_claude_text_editor_tool_mode = false, -- Whether to enable Claude Text Editor Tool Mode.
  },
  mappings = {
            ---@class AvanteConflictMappings
            suggestion = {
                accept = "<M-CR>",
            },
        },
}


