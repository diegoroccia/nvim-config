# Neovim Configuration

A modern Neovim configuration built with lazy.nvim, featuring LSP support, AI assistance, and a comprehensive plugin ecosystem optimized for development workflow.

## Features

- 🚀 **Fast startup** with lazy.nvim plugin management
- 🔍 **Smart pickers** with Snacks.nvim for files, buffers, and grep
- 🎨 **Beautiful UI** with Catppuccin theme and Lualine status bar
- 📝 **Advanced LSP** support with multiple language servers
- 🤖 **AI assistance** with Copilot and Avante.nvim
- ⚡ **Modern completion** with blink.cmp
- 🔧 **Intelligent formatting** with conform.nvim + LSP
- 📊 **Enhanced diagnostics** with Trouble.nvim

## Installation

1. Backup your existing Neovim configuration
2. Clone this configuration to your Neovim config directory
3. Start Neovim - plugins will install automatically
4. Restart Neovim for full functionality

## Keyboard Shortcuts Cheatsheet

> **Leader key**: `<Space>`

### 📁 File Operations
| Shortcut | Description |
|----------|-------------|
| `<leader><space>` | Smart Find Files |
| `<leader>,` | Switch Buffers |
| `<leader>f` | File Explorer |

### 🔍 Search & Navigation
| Shortcut | Description |
|----------|-------------|
| `<leader>/` | Live Grep |
| `<leader>:` | Command History |
| `<leader>n` | Notification History |
| `<C-e>` | Emoji Explorer *(insert mode)* |

### 🪟 Window Management
| Shortcut | Description |
|----------|-------------|
| `<C-h>` | Go to Left Window |
| `<C-j>` | Go to Lower Window |
| `<C-k>` | Go to Upper Window |
| `<C-l>` | Go to Right Window |

### 🔧 LSP Features
| Shortcut | Description |
|----------|-------------|
| `gd` | Goto Definition |
| `gD` | Goto Declaration |
| `gI` | Goto Implementation |
| `gy` | Goto Type Definition |
| `gr` | Find References |
| `K` | Hover Documentation |
| `<leader>rn` | Rename Symbol |
| `<leader>ca` | Code Actions |
| `<leader>=` | Format Buffer |
| `<leader>ss` | LSP Symbols |
| `<leader>sS` | LSP Workspace Symbols |

### 🩺 Diagnostics & Debugging
| Shortcut | Description |
|----------|-------------|
| `<leader>sD` | All Diagnostics |
| `<leader>sd` | Buffer Diagnostics |
| `<leader>xx` | Diagnostics (Trouble) |
| `<leader>xX` | Buffer Diagnostics (Trouble) |
| `<leader>cs` | Symbols (Trouble) |
| `<leader>cl` | LSP Definitions/References (Trouble) |
| `<leader>xL` | Location List (Trouble) |
| `<leader>xQ` | Quickfix List (Trouble) |


### 🤖 AI Assistance
| Shortcut | Description |
|----------|-------------|
| `<leader>ua` | Ask AI (Avante) |
| `<leader>ue` | Edit with AI (Avante) |
| `<leader>ur` | Refresh AI (Avante) |

#### AI Diff & Conflict Resolution
| Shortcut | Description |
|----------|-------------|
| `co` | Accept our changes |
| `ct` | Accept their changes |
| `ca` | Accept all their changes |
| `cb` | Accept both changes |
| `cc` | Accept cursor changes |
| `]x` | Next conflict |
| `[x` | Previous conflict |

#### AI Suggestions
| Shortcut | Description |
|----------|-------------|
| `<M-l>` | Accept suggestion |
| `<M-]>` | Next suggestion |
| `<M-[>` | Previous suggestion |
| `<C-]>` | Dismiss suggestion |

### 📝 Git Integration
| Shortcut | Description |
|----------|-------------|
| `<leader>gc` | Git Commit (Neogit) |
| `<leader>gp` | Git Push (Neogit) |

### 🎯 Text Selection (Treesitter)
| Shortcut | Description |
|----------|-------------|
| `gnn` | Init Selection |
| `grn` | Expand Selection |
| `grc` | Expand to Scope |
| `grm` | Shrink Selection |
| `]z` | Next Account ID |
| `[z` | Previous Account ID |

### 🔧 Toggle Options
| Shortcut | Description |
|----------|-------------|
| `\s` | Toggle Spelling |
| `\w` | Toggle Word Wrap |
| `\L` | Toggle Relative Numbers |
| `\l` | Toggle Line Numbers |
| `\d` | Toggle Diagnostics |
| `\c` | Toggle Conceal Level |
| `\T` | Toggle Treesitter |
| `\b` | Toggle Dark/Light Background |
| `\h` | Toggle Inlay Hints |
| `\g` | Toggle Indent Guides |
| `\D` | Toggle Dim Inactive |
| `\k` | Toggle ScreenKey |

### ⚡ Enhanced Quickfix (nvim-bqf)
| Shortcut | Description |
|----------|-------------|
| `o` | Open item |
| `O` | Open item and close quickfix |
| `<C-s>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `t` | Open in new tab |
| `T` | Open in new tab (keep focus on quickfix) |
| `<Tab>` | Toggle item selection |
| `<S-Tab>` | Toggle item selection (reverse) |
| `<C-p>` | Previous file |
| `<C-n>` | Next file |
| `z,` | Toggle preview mode |
| `<C-b>` | Scroll preview up |
| `<C-f>` | Scroll preview down |

## Language Server Configuration

The following LSP servers are configured and will be automatically enabled:

- **Lua**: `luals` (Lua Language Server)
- **Go**: `gopls` (Go Language Server)
- **Python**: `ruff` (Python Linter/Formatter)
- **TypeScript/JavaScript**: `tsserver` (TypeScript Language Server)
- **YAML**: `yamlls` (YAML Language Server)
- **JSON**: `json` (JSON Language Server)
- **CUE**: `cue` (CUE Language Server)
- **KCL**: `kcl` (KCL Language Server)
- **Markdown**: `markdown` (Markdown Language Server)
- **Rego**: `regal` (Rego Language Server)
- **Text**: `harper_ls` (Grammar/Spell Checker)

## Formatting

The configuration uses a hybrid formatting approach:

1. **LSP formatting** is preferred when available
2. **conform.nvim** formatters are used as fallback:
   - **Lua**: stylua
   - **Python**: ruff_format
   - **Go**: gofumpt
   - **JavaScript/TypeScript/JSON/YAML/Markdown**: prettier

## Plugin Management Commands

```bash
# Open plugin manager
nvim +Lazy

# Sync all plugins
nvim +"Lazy sync"

# Clean unused plugins
nvim +"Lazy clean"

# Profile plugin load times
nvim +"Lazy profile"

# Show LSP status
nvim +"LspInfo"

# Show formatters for current buffer
:ConformInfo
```

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── lua/
│   ├── config/                 # Core configuration modules
│   │   ├── lazy.lua           # Plugin manager setup
│   │   ├── lsp.lua            # LSP configuration
│   │   ├── options.lua        # Vim options
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── autocommands.lua   # Auto commands
│   │   └── diagnostics.lua    # Diagnostic settings
│   └── plugins/               # Plugin configurations
│       ├── avante.lua         # AI assistance
│       ├── blink.lua          # Completion engine
│       ├── catppuccin.lua     # Color scheme
│       ├── git.lua            # Git integration
│       ├── lualine.lua        # Status line
│       ├── mason.lua          # LSP/tool manager
│       ├── mini.lua           # Mini.nvim modules
│       ├── snacks.lua         # Snacks.nvim (pickers/explorer)
│       ├── treesitter.lua     # Syntax highlighting
│       └── trouble.lua        # Diagnostics UI
├── lsp/                       # Individual LSP server configs
└── ftdetect/                  # Custom filetype detection
```

## Tips

- Use `<leader><space>` for quick file access
- Press `<leader>,` to switch between recent buffers
- Use `K` on any symbol to get hover documentation
- All formatting happens automatically on save
- Use `\` prefix for quick toggles (spell check, line numbers, etc.)

---

*This configuration is optimized for development workflow with a focus on speed, functionality, and modern Neovim features.*