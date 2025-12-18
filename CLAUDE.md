# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modern Neovim configuration built around the lazy.nvim plugin manager with a modular structure. The configuration follows a clean separation of concerns:

### Core Structure

- `init.lua` - Main entry point that sets up the leader keys and loads all config modules
- `lua/config/` - Core configuration modules (options, keymaps, LSP setup, etc.)
- `lua/plugins/` - Plugin specifications using lazy.nvim's declarative format
- `lsp/` - Individual LSP server configurations as separate modules

### Key Architectural Patterns

**Modular LSP Configuration**: Each LSP server has its own configuration file in the `lsp/` directory (gopls.lua, pyright.lua, etc.) that exports a table with server settings. The main LSP setup in `lua/config/lsp.lua` enables multiple servers using `vim.lsp.enable()` and handles common LSP functionality through autocommands.

**Plugin Organization**: Plugins are organized by functionality in separate files within `lua/plugins/`. Each plugin file returns a table (or array of tables) following lazy.nvim's plugin specification format.

**Global Helper Function**: The config defines a global `_G.map` function for consistent LSP keymapping across the configuration.

**Snacks.nvim Integration**: Uses Snacks.nvim as the primary picker/explorer interface, with keybindings in both the main Snacks config and LSP setup.

## Development Commands

### Plugin Management
```bash
nvim +Lazy                    # Open lazy.nvim plugin manager
nvim +"Lazy sync"             # Sync all plugins
nvim +"Lazy clean"            # Clean unused plugins
nvim +"Lazy profile"          # Profile plugin load times
```

### LSP Operations
The configuration enables multiple LSP servers automatically. To check LSP status:
```bash
nvim +"LspInfo"               # Show active LSP clients
```

### Formatting Commands
With conform.nvim configured, you can format manually:
```vim
:ConformInfo                  # Show formatters for current buffer
```
The configuration automatically formats on save, preferring LSP formatting when available.


### Key Development Directories

- `lua/config/` - Contains core Neovim configuration modules
- `lua/plugins/` - Plugin specifications for lazy.nvim
- `lsp/` - Individual LSP server configuration files
- `ftdetect/` - Custom filetype detection
- `after/ftplugin/` - Filetype-specific settings

## Special Configuration Details

**Local Plugin Development**: The lazy.nvim configuration includes a `dev` section pointing to `~/code/zalando-personal/` for local plugin development, specifically for the `diego-roccia_zse` pattern.

**Zalando-specific Integration**: Includes a custom Zalando plugin (`zalando.nvim`) configured for the "zalando-build" organization with "cloud-platform" topic.

**AI/Copilot Setup**: Configured with multiple AI assistance tools:
- GitHub Copilot via copilot.lua
- Avante.nvim with modern configuration and custom ZLLM provider
- MCP Hub integration for enhanced AI capabilities
- Advanced diff resolution and suggestion handling

**Advanced LSP Features**: The LSP setup includes automatic formatting on save, document highlighting, inlay hints, folding support, and comprehensive keymaps using Snacks pickers.

**Formatting Strategy**: Uses a hybrid approach with conform.nvim and LSP formatting:
- Prefers LSP formatting when available
- Falls back to conform.nvim formatters for specific file types
- Configured formatters: stylua (Lua), ruff_format (Python), gofumpt (Go), prettier (JS/TS/JSON/YAML/Markdown)


**Enhanced Quickfix**: nvim-bqf provides advanced quickfix functionality with preview, filtering, and better navigation.

## Configuration Modifications

When modifying this configuration:

1. **Adding new LSP servers**: Create a new file in `lsp/` directory following the pattern of existing servers, then add the server name to the list in `lua/config/lsp.lua:6-18`

2. **Adding plugins**: Create new plugin specifications in appropriate files within `lua/plugins/` or create new plugin files following the existing pattern

3. **Modifying formatters**: Update the `formatters_by_ft` table in `lua/plugins/mason.lua` to add support for new file types

4. **Modifying keymaps**: The global `_G.map` function should be used for LSP-related keymaps. Other keymaps can be added to `lua/config/keymaps.lua` or within plugin specifications

5. **LSP customization**: Modify the LspAttach autocommand in `lua/config/lsp.lua:20-90` to add functionality that should apply to all LSP clients

## New Plugin Integrations

**lazydev.nvim**: Now enabled for enhanced Lua development with proper LSP support for Neovim APIs

**conform.nvim**: Fully configured with formatters for common file types, integrated with LSP formatting

**nvim-bqf**: Enhances quickfix windows with preview, filtering, and better navigation

**avante.nvim**: Updated to modern configuration format with improved diff resolution, suggestion handling, window management, and proper provider configuration migration (temperature moved to extra_request_body)

**catppuccin**: Optimized with compilation caching and reduced integrations for dramatically faster loading (~5ms vs potentially seconds)