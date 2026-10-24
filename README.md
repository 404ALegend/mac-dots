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

The repository contains no identities, accounts, SSH configuration, encrypted files, or personal service configuration. Personal settings belong in the private `mac-dots-personal` overlay.

## Personal overlay

A personal Mac can apply the private overlay after this base:

```sh
chezmoi apply -S "$HOME/.local/share/chezmoi-personal" \
  -c "$HOME/.config/chezmoi/personal.toml"
```

No work Mac needs the private overlay.
