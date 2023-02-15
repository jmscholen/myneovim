local M = {}

local tmux = require("tmux-awesome-manager")

function M.setup_which_key()
  local wk = require("which-key")

  local mood_dotfiles = {
    {
      path = "~/.config/nvim/lua/user/config.lua",
      display = "User Configuration | Configure your neovim plugins, themes, etc.",
      order = "1"
    },
    {
      path = "~/.config/nvim/lua/user/keybindings.lua",
      display = "Keybindings        | Configure your personal keybindings.",
      order = "2"
    },
    {
      path = "~/.config/nvim/lua/user/lsp.lua",
      display = "LSP                | Configure the LSP (Language server protocol)",
      order = "3"
    },
    {
      path = "~/.config/nvim/lua/user/plugins.lua",
      display = "Plugins            | Add more plugins to your neovim.",
      order = "4"
    },
  }

  wk.register({
  h = {
    name = "+Calculate",
    s = { "<Plug>AutoCalcAppendWithSum", "Sum" },
    ["?"] = { "<Plug>AutoCalcAppend", "Auto Calculation" },
    },
  ["<C-g>"] = { ":<c-u>call AppendSelectionToQuickConsult()<CR>", "Append Selection" },
  n = {
    name = "+Toggle Case",
    s = { ":Snake<CR>", "snake_case" },
    c = { ":Camel<CR>", "CamelCase" },
    b = { ":CamelB<CR>", "camelCaseB" }
    },
  z = {
    n = { ":NoteFromSelectedText<CR>", "New Note from Selected Text" }
    },
  l = {
    tmux.send_text_to,
    "Send selection to tmux window / pane",
  },
  c = {
    name = "+Lsp",
    a = { "<cmd>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" }
    },
  m = {
    name = "+Ruby Extract",
    l = { ":RExtractLet<CR>", "Extract Let" },
    v = { ":RExtractLocalVariable<CR>", "Extract Variable" }
  },
  }, { mode = "v", prefix = "<leader>" })

  -- Normal mode:
  wk.register({
  x = { "<C-w>c", "Kill Window" },
  ["-"] = { "migg=G\'i:w<CR>", "Indent Current File" },
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",
  b = {
    name = "+Buffer",
    N = { ":e ~/.nvim-scratch<CR>", "Open Scratch Buffer" },
    f = { ":Telescope buffers only_cwd=true<CR>", "Find Buffers in this project" },
    F = { ":Telescope buffers<CR>", "Find all buffers" },
  },
  [";"] = { ":Telescope buffers ignore_current_buffer=true sort_mru=true<CR>", "Find All Buffers" },
  ["*"] = { ":Telescope grep_string<CR>", "Search string at point on project" },
  ["<space>"] = { ":Telescope find_files<CR>", "Find Files" },
  e = { ":Neotree toggle<CR>", "Toggle Tree" },
  E = { ":Neotree git_status<CR>", "Tree Git Status" },
  d = { ":call AddDebugger()<CR>", "+Debug" },
  D = { ":call ClearDebugger()<CR>", "Clear debuggers" },
  u = { ":UndotreeToggle<CR>", "Undo Tree" },
  a = { ":call OpenTestAlternate()<cr>", "Go to Test" },
  n = {
    name = "+Toggle Case",
    s = { ":Snake<CR>", "snake_case" },
    c = { ":Camel<CR>", "camelCase" },
    b = { ":CamelB<CR>", "CamelCaseB" }
    },
  h = {
    name = "+Help",
    l = { ':lua require("persistence").load()<cr>', "Load Session" },
    t = { ":Telescope colorscheme<CR>", "Change Theme" },
    h = { ":e ~/.config/nvim/handbook.md<CR>:AerialToggle<CR><C-w>h", "Open the Handbook" },
    u = { ":UpdateMood<CR>", "Update mooD" },
    d = { ":!rm -rf ~/.local/share/nvim/swap/*<CR>", "Delete SWP files" },
    r = { ":LspRestart<CR>", "Restart LSP" },
    T = { ":lua require('tutorial').start()<CR>", "Start Tutorial" }
    },
  A = { ":call OpenTestAlternateAndSplit()<cr>", "Go to Test (split)" },
  ["."] = { ":Telescope file_browser path=%:p:h hidden=true respect_gitignore=false<CR>", "File Browser" },
  p = { ":Telescope yank_history<CR>", "Yank History" },
   ["<C-g>"] = {
     name = "+QuickConsult",
     a = { ":call AppendClipboardToQuickConsult()<CR>", "Append Text From Clipboard to Quick Consult" },
     s = { ":call SaveClipboardToQuickConsult()<CR>", "Save Text From Clipboard to Quick Consult" }
   },
  l = {
    name = '+TMUX Terminals',
    o = { tmux.switch_orientation, 'Switch Orientation' },
    p = { tmux.switch_open_as, 'Switch Open As to Pane / Window' },
    f = { ':Telescope tmux-awesome-manager list_terms<CR>', 'List all Terms' },
    l = { ':Telescope tmux-awesome-manager list_open_terms<CR>', 'List Open Terms' },
    k = { tmux.kill_all_terms, 'Kill all Terms' }
  },
  t = {
    name = '+Test',
    v = { ":TestFile<CR>", "Test Current File" },
    s = { ":TestNearest<CR>", "Test Nearest Test" },
    a = { ":TestSuite<CR>", "Test Project" },
    f = { ":RSpec --only-failures --format documentation<CR>", "Test Only Failed Tests" },
    r = { ":TestLast<CR>", "Rerun Last Test" },
  },
  z = {
    name = '+Notes',
    n = { ":Note<CR>", "New Note" },
    z = { ":Note ", "Find Note" },
    s = { ":SearchNotes ", "Search inside notes" },
    d = { ":DeleteNote<CR>", "Delete Current Note" },
    m = { ":NoteToMarkdown<CR>", "Convert Note do Markdown" },
    },
  c = {
    name = "+Lsp",
    w = {
      name = "+Workspace",
      a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace' },
      r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace' },
      l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspaces' },
      },
    x = { ':Telescope diagnostics<CR>', 'Diagnostics' },
    X = { ':Telescope diagnostics<CR>', 'Diagnostics' },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
    f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format' },
    i = { ':Telescope lsp_document_symbols<CR>', 'Document Symbols' },
    j = { ':Telescope lsp_dynamic_workspace_symbols<CR>', 'Workspace Symbols' },
    },
  ["<return>"] = { ":Telescope resume<CR>", "Telescope Resume" },
  s = {
    name = "+Search",
    D = { ":lua require('mood-scripts.custom_telescope').live_grep_in_folder()<CR>", 'Search text in one or more folders' },
    d = { ":lua require('telescope.builtin').live_grep { search_dirs = {vim.fn.expand('%:p:h')}, prompt_title = 'Live grep inside ' .. vim.fn.expand('%:p:h') }<CR>", 'Search text in some folder' },
    p = { ":Telescope live_grep<CR>", "Search text on Project" },
    o = { ":Telescope live_grep grep_open_files=true<CR>", "Search on Open Files" },
    P = { ":lua require('mood-scripts.custom_telescope').ripgrep()<CR>", "Advanced Search text on Project" },
    f = { ":CtrlSF ", "Search text using CoC (for search and replace)" },
    s = { ":Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>", "Fuzzy Current Buffer" },
    i = { ":Telescope lsp_document_symbols<CR>", "Search Outline Symbols" },
    j = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Symbols" },
    },
  f = {
    name = "+File",
    o = { ":AerialToggle<CR>", "Show Window Symbols" },
    a = { ":lua require('telescope-alternate.telescope').alternate()<CR>", "Alternate File" },
    r = { ":Telescope oldfiles<CR>", "Recent Files" },
    R = { ":call BetterRename()<CR>", "Rename Current File" },
    M = { ":call BetterMove()<CR>", "Move Current File" },
    D = { ":call BetterDelete()<CR>", "Delete the current file" },
    p = { function() require('mood-scripts.open-files').call(mood_dotfiles) end, "User Mood Files" },
    d = { function() require('mood-scripts.open-files').call(vim.g.dotfiles) end, "Dotfiles" },
    y = { ":call CopyRelativePath()<CR>", "Copy Relative Path" },
    l = { ":call CopyRelativePathWithLine()<CR>", "Copy Path With Line" },
    Y = { ":call CopyFullPath()<CR>", "Copy Full Path" },
    C = { ":call BetterCopy()<CR>", "Copy current file to" }
    },
  m = {
    name = "+Ruby",
    a = { ":RAddParameter<CR>", "Add Parameter" },
    c = { ":call GetClassName()<CR>", "Copy Class Name to Clipboard" },
    C = { ":call SearchClassName()<CR>", "Search current class on project" },
    d = { ":lua require('mood-scripts.rubocop').comment_rubocop()<CR>", "Comment Rubocop Error" },
    },
  ["#"] = { tmux.run_project_terms, "Execute / Re-excute project terminals" },
  ["%"] = { ":lua require('mood-scripts.command-on-start').restart_all()<CR>", "TMUX: Execute / Re-execute project terminal all" },
  g = {
    name = "+Git",
    g = { ":LazyGit<CR>", "LazyGit" },
    t = { ":lua require('agitator').git_time_machine()<CR>", "Git Time Machine" },
    T = { ":DiffviewFileHistory %<CR>:echo 'Use SPC q d or :DiffviewClose to quit.'<CR>", "File History" },
    r = { ":Gitsigns reset_hunk<CR>", "Reset hunk at point" },
    c = { ":Gdiff<CR>", "Diff from HEAD" },
    s = { ":Gitsigns stage_hunk<CR>", "Stage hunk at point" },
    S = { ":Gitsigns stage_buffer<CR>", "Stage buffer" },
    R = { ":Gitsigns reset_buffer<CR>", "Reset buffer" },
    p = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
    b = { ":Git blame<CR>", "Blame" },
    d = { ":DiffviewOpen<CR>:echo 'Use SPC q d or :DiffviewClose to quit.'<CR>", "Git Diff" },
    l = { ":DiffviewFileHistory<CR>:echo 'Use SPC q d or :DiffviewClose to quit.'<CR>", "Log Commits" },
    B = { ":Telescope git_branches<CR>", "Change Branch" }
    },
  [','] = { ":Telescope buffers only_cwd=true ignore_current_buffer=true sort_mru=true<CR>", "Find Buffers in this project" },
  ['<tab>'] = { ":Telescope git_status<CR>", "Git Modified Files" },
  j = {
    name = "+Rest",
    r = { "<Plug>RestNvim<CR>", "Run" },
    R = { "<Plug>RestNvimLast<CR>", "Run Last" },
    p = { "<Plug>RestNvimPreview<CR>", "Preview" },
    m = { ":set filetype=http<CR>", "Set Current File as HTTP" },
    h = { ":!open https://github.com/NTBBloodbath/rest.nvim/tree/main/tests", "See Examples of usages" },
  },
  w = {
    name = "+Window",
    w = { "<C-w>w", "Next Window" },
    W = { "<C-w>W", "Previous Windows" },
    o = { "<C-w>o", "Maximize Window" },
    u = { "<C-w>u", "Restore killed window" },
    c = { ":call undoquit#SaveWindowQuitHistory()<cr><c-w>c", "Close Window" },
    q = { ":call undoquit#SaveWindowQuitHistory()<cr><c-w>c", "Kill Window" },
    x = { "<C-w>x", "Swap windows" },
    v = { "<C-w>v", "Split Vertical" },
    s = { "<C-w>s", "Split Horizontal" }
    },
    q = {
      name = "+Quit and Close",
      q = { ":qall<CR>", "Quit Vim" },
      c = {":cclose<CR>", "Quick Fix Close"},
      d = { ":DiffviewClose<CR>", "Close Diffview" }
    }
  }, { prefix = "<leader>", silent = false })
end

function M.setup_mappings()
  local bufopts = { noremap=true, silent=true }

  local set = vim.keymap.set

  set('n', '<M-l>', '<C-w>l', bufopts)
  set('n', '<M-h>', '<C-w>h', bufopts)
  set('n', '<M-k>', '<C-w>k', bufopts)
  set('n', '<M-j>', '<C-w>j', bufopts)
  set('n', ']g', ':Gitsigns next_hunk<CR>', bufopts)
  set('n', '[g', ':Gitsigns prev_hunk<CR>', bufopts)
  set('n', 'yb', ':%y+<CR>', bufopts)

  set('n', '<Esc>', ':noh<CR><esc>', bufopts)

  set('t', '<C-g>', '<C-\\><C-n>')
  set('t', '<C-v>', '<C-\\><C-N>pi')

  set('n', ']q', ':cnext<CR>')
  set('n', '[q', ':cprevious<CR>')
  set('n', '\\', ':wall<CR>')
  set('n', 'ç', ':wall<CR>')
  set('n', '-', '$')
  set('v', '-', '$<Left>')
  set('n', ',', '<C-w>w')
  set('n', 'gh', ':SidewaysLeft<cr>')
  set('n', 'gl', ':SidewaysRight<cr>')
  set('v', 'J', ":m '>+1<CR>gv=gv")
  set('v', 'K', ":m '<-2<CR>gv=gv")
  set('n', '<c-w>c', ':call undoquit#SaveWindowQuitHistory()<cr><c-w>c')
  set('i', '<C-v>', '<C-r>+')
  set('c', '<C-v>', '<C-r>+')
  set('v', '<', '<gv')
  set('v', '>', '>gv')
  set('x', 'q', 'iq')
  set('o', 'q', 'iq')
  set('o', 'aa', '<Plug>SidewaysArgumentTextobjA')
  set('x', 'aa', '<Plug>SidewaysArgumentTextobjA')
  set('o', 'ia', '<Plug>SidewaysArgumentTextobjI')
  set('x', 'ia', '<Plug>SidewaysArgumentTextobjI')
  set('i', '<C-l>', '<Right>')
  set('i', '<C-a>', '<C-o>0')
  set('i', '<C-h>', '<Left>')
  set('c', '<C-l>', '<Right>')
  set('c', '<C-h>', '<Left>')
  set('c', '<C-a>', '<Home>')
  set('c', '<C-e>', '<End>')
  set('c', '<C-j>', '<C-left>')
  set('c', '<C-k>', '<C-right>')
  set('i', '<C-p>', '<Plug>(emmet-expand-abbr)')
  set('n', 'gF', '<C-w>f')
  set('i', '<C-d>', '<Delete>')
  set('c', '<C-d>', '<Delete>')
  set('n', '<CR>', ':call Maximize()<CR>')

  set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
  set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
  set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
  set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')
  set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>')
  set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>')
  set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>')
  set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>')
  set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>')

  set('n', 'H', '<cmd>BufferLineCyclePrev<cr><CR>')
  set('n', 'L', '<cmd>BufferLineCycleNext<CR>')

  set('v', '<C-g>', ':<c-u>call SaveSelectionToQuickConsult()<cr>')
  set('n', '<C-g>', ':<c-u>call OpenConsultationWindow()<cr>')

  local tmux_win = require("mood-scripts.tmux-integration")

  set({'n', 'i', 'v', 'c'}, '<C-w>;', tmux_win.go_to_next, {})
  set({'n', 'i', 'v', 'c'}, '<C-w>,', tmux_win.go_to_prev, {})

  set('n', ']d', vim.diagnostic.goto_next)
  set('n', '[d', vim.diagnostic.goto_prev)

  vim.cmd([[
    nnoremap <expr> 0 (col('.') - 1) == match(getline('.'),'\S') ? "<Home>" : "^"
    vnoremap <expr> 0 (col('.') - 1) == match(getline('.'),'\S') ? "<Home>" : "^"

    nmap vq viq
    nmap dq diq
    nmap yq yiq
    nmap cq ciq
    nmap vij vaI
    nmap vai vaI
    nmap vaj vaIj
    nmap dij daI
    nmap daI daI
    nmap daj vaIjd
    nmap cij caI
    nmap caj vaI
    nmap cai caI

    nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
    nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
    nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
    nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"

    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
    nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
    xnoremap <silent><expr> A mode() ==# "V" ? "<C-v>$A" : "A"
    xnoremap <silent><expr> I mode() ==# "V" ? "<C-v>$^I" : "I"
    xnoremap <silent><expr> i mode() ==# "V" ? "<C-v>$\<Home>I" : "i"

    nmap gq "jyiwmo:,$s/<C-r>=WordForGq()<CR>//gcie\|1,''-&&\|:norm `ozz<c-b><c-e><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
    nmap gQ "jyiwmo:,$S/<C-r>=WordForGq()<CR>//gcie\|1,''-&&\|:norm `ozz<c-b><c-e><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
    xnoremap gq "jymo:,$s/<C-r>=WordForGq()<CR>//gcie\|1,''-&&\|:norm `ozz<c-b><c-e><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
    xnoremap gQ "jymo:,$S/<C-r>=WordForGq()<CR>//gcie\|1,''-&&\|:norm `ozz<c-b><c-e><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
  ]])
end

function M.setup()
  M.setup_which_key()
  M.setup_mappings()
end

return M
