# Valerio's Dotfiles

Personal configuration files for the tools I use every day. This repository is intended to keep my development environment consistent across machines while remaining easy to install and maintain.

## Installation

### Requirements

- Git
- Bash
- [mise](https://mise.jdx.dev/)
- A Unix-like environment with support for symbolic links
- [Neovim](https://neovim.io/) 0.11 or later (0.12 recommended)

Clone the repository and run the installer:

```bash
git clone https://github.com/clemenzi/dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

The installer creates the required directories and symlinks the Neovim configuration to `~/.config/nvim`. It is safe to run again when the configuration changes.

Install the development tools and Git hooks with mise:

```bash
cd ~/.dotfiles
mise install
mise run install-hooks
```

Run the formatter manually with `mise run fmt`.

## Repository layout

```text
.
├── config/
│   └── nvim/       # Neovim configuration and plugins
├── install.sh      # Installation script
├── mise.toml       # Development tools and tasks
└── README.md
```

## Personal-use policy

This is a public repository containing my personal dotfiles. You are welcome to use it as a reference or adapt it for your own setup, but pull requests for changes to my personal configuration are not accepted.

If you want to contribute an improvement, please fork the repository and maintain your changes separately. I do not provide support or troubleshooting for these dotfiles. Use them at your own risk.
