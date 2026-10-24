# mac-dots

Portable macOS dotfiles managed by [Chezmoi](https://www.chezmoi.io/).

## Included configuration

- Zsh, Git, Starship, and shared Mise tools.
- Ghostty with Catppuccin Mocha.
- Tmux, Sesh, and Workmux.
- Shared OMP plugins: Plannotator and Agent Simple English.

## Install

Install ChezMoi through the approved company process, then run:

```sh
chezmoi init 404ALegend/mac-dots
chezmoi apply
```

The repository contains no identities, accounts, SSH configuration, encrypted files, or personal service configuration.

## Personal overlay

On a personal Mac, initialize the private overlay after the public base:

```sh
chezmoi init \
  -S "$HOME/.local/share/chezmoi-personal" \
  -C "$HOME/.config/chezmoi/personal.toml" \
  --promptChoice "machineProfile=personal" \
  404ALegend/mac-dots-personal

chezmoi -S "$HOME/.local/share/chezmoi-personal" \
  -c "$HOME/.config/chezmoi/personal.toml" \
  apply
```

The private overlay supplies personal identities, encrypted files, and services. No work Mac needs it.
