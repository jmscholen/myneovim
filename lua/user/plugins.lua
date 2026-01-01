-- Plugins -------------
-- Add your plugins here
------------------------

local user_plugins = {
  -- { 'goolord/alpha-nvim', enabled = false },
  -- Amp Plugin
  {
    "sourcegraph/amp.nvim",
    branch = "main", 
    lazy = false,
    opts = { auto_start = true, log_level = "info" },
  },
  'kat0h/nyancat.vim',
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup({
        -- Terminal window settings
        window = {
          split_ratio = 0.3,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
          position = "botright",  -- Position of the window: "botright", "topleft", "vertical", "float", etc.
          enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
          hide_numbers = true,    -- Hide line numbers in the terminal window
          hide_signcolumn = true, -- Hide the sign column in the terminal window
          
          -- Floating window configuration (only applies when position = "float")
          float = {
            width = "80%",        -- Width: number of columns or percentage string
            height = "80%",       -- Height: number of rows or percentage string
            row = "center",       -- Row position: number, "center", or percentage string
            col = "center",       -- Column position: number, "center", or percentage string
            relative = "editor",  -- Relative to: "editor" or "cursor"
            border = "rounded",   -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
          },
        },
        -- File refresh settings
        refresh = {
          enable = true,           -- Enable file change detection
          updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
          timer_interval = 1000,   -- How often to check for file changes (milliseconds)
          show_notifications = true, -- Show notification when files are reloaded
        },
        -- Git project settings
        git = {
          use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
        },
        -- Shell-specific settings
        shell = {
          separator = '&&',        -- Command separator used in shell commands
          pushd_cmd = 'pushd',     -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
          popd_cmd = 'popd',       -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
        },
        -- Command settings
        command = "claude",        -- Command used to launch Claude Code
        -- Command variants
        command_variants = {
          -- Conversation management
          continue = "--continue", -- Resume the most recent conversation
          resume = "--resume",     -- Display an interactive conversation picker

          -- Output options
          verbose = "--verbose",   -- Enable verbose logging with full turn-by-turn output
        },
        -- Keymaps
        keymaps = {
          toggle = {
            normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
            terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
            variants = {
              continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
              verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
            },
          },
          window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
          scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
        }
      })
    end
  },
  {
    "yetone/avante.nvim",
    --- other configuration items ...
    opts = {
      --- other configuration items ...
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          extra_request_body = {
            temperature = 0,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          },
        },
        -- ollama = {
        --   endpoint = "http://127.0.0.1:11434",
        --   timeout = 30000, -- Timeout in milliseconds
        --   extra_request_body = {
        --     options = {
        --       temperature = 0.75,
        --       num_ctx = 20480,
        --       keep_alive = "5m",
        --     },
        --   },
        -- },
        -- groq = {
        --   __inherited_from = 'openai',
        --   api_key_name = 'GROQ_API_KEY',
        --   endpoint = 'https://api.groq.com/openai/v1/',
        --   model = 'llama-3.3-70b-versatile',
        --   disable_tools = true,
        --   extra_request_body = {
        --     temperature = 1,
        --     max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
        --   },
        -- },
      },
    },
    --- other configuration items
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}

return user_plugins
