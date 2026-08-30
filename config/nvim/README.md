# Valerio's Neovim Configuration

A versatile Neovim configuration designed to work seamlessly both as a standalone editor and within VSCode using the [Neovim extension](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim).

Requirements: Neovim 0.11+ (0.12 recommended), Git, and a working clipboard provider.

On first launch, `lazy.nvim` installs the plugins. Mason installs `lua_ls` automatically; add other servers to `ensure_installed` in `lua/vcz/plugins/lsp.lua` when needed.
