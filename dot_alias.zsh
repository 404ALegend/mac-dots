
#⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⢠⣤⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
# ⡀⡀⡀⡀⡀⣿⣿⡀⡀⡀⡀⡀⡀⢸⣿⡀⡀⡀⣿⣿⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
# ⡀⡀⡀⡀⣼⡿⢻⣷⡀⡀⡀⡀⡀⢸⣿⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀
# ⡀⡀⡀⢠⣿⠁⡀⣿⣆⡀⡀⡀⡀⢸⣿⡀⡀⡀⣿⡇⡀⡀⡀⣠⣶⣿⣿⣷⣄⡀⡀⡀⣴⣿⠿⠿⣿⣦⡀⡀⡀⣴⣿⠿⠿⣿⣦⡀⡀⡀⣴⣿⠿⠿⣿⣦
# ⡀⡀⡀⣿⡏⡀⡀⠸⣿⡀⡀⡀⡀⢸⣿⡀⡀⡀⣿⡇⡀⡀⡀⠙⠁⡀⡀⠈⣿⡄⡀⡀⣿⡅⡀⡀⡀⡀⡀⡀⣿⡟⡀⡀⡀⡀⢿⣧⡀⡀⣿⡅⡀⡀⡀⡀
# ⡀⡀⣼⣿⣤⣤⣤⣤⣿⣷⡀⡀⡀⢸⣿⡀⡀⡀⣿⡇⡀⡀⡀⣤⣶⣾⠿⠿⣿⡇⡀⡀⠈⠻⣷⣦⣄⡀⡀⡀⣿⠿⠿⠿⠿⠿⠿⠿⡀⡀⠈⠻⣷⣦⣄⡀
# ⡀⢠⣿⠋⠉⠉⠉⠉⠉⣿⣆⡀⡀⢸⣿⡀⡀⡀⣿⡇⡀⡀⣾⣿⡀⡀⡀⡀⣿⡇⡀⡀⡀⡀⡀⡀⠻⣿⡀⡀⣿⣆⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⠻⣿
# ⡀⣿⡟⡀⡀⡀⡀⡀⡀⢹⣿⡀⡀⢸⣿⡀⡀⡀⣿⡇⡀⡀⠹⣿⣦⣤⣴⡿⣿⡇⡀⠠⣿⣤⣀⣀⣼⣿⡀⡀⠙⣿⣶⣄⣀⣠⣾⠟⡀⠠⣿⣤⣀⣀⣼⣿
# ⠈⠉⡀⡀⡀⡀⡀⡀⡀⡀⠉⠁⡀⠈⠉⡀⡀⡀⠉⠁⡀⡀⡀⡀⠉⠉⡀⡀⠈⠉⡀⡀⡀⠉⠛⠛⠉⡀⡀⡀⡀⡀⠉⠛⠛⠋⡀⡀⡀⡀⡀⠉⠛⠛⠉⡀


# Bat aliases
alias cat='bat'

# Eza tree aliases
alias tree='eza --tree --level=3 --all --ignore-glob=.git --icons=auto'
alias dtree='eza --tree --level=3 --all --only-dirs --ignore-glob=.git --icons=auto'

# Session aliases
alias e='exit'
alias ce='chezmoi add --encrypt'
alias cz='chezmoi'
alias cza='chezmoi add'
alias czap='chezmoi apply --force'
alias leetcode='nvim leetcode.nvim'
alias lomp='omp --no-session --no-skills --no-rules --no-extensions --tools=read,write,grep,glob,bash,edit,todo'
alias n='nvim .'
alias py='python3'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tk='tmux kill-session -t'
alias tnw='tmux new-session -s'
alias tp='tuicr pr'
alias tvc='tv channels'
alias tvd='tv dirs'
alias tvf='tv files'
alias tvp='tv git-repos'
alias tvt='tv todo-comments'
alias tvz='tv zoxide'
alias tw='tuicr -w'
alias un='brew uninstall'
alias up='brew update'
alias zsrc='source "$HOME/.zshrc"'
alias mu='mise upgrade --bump --global'
alias cgp='chezmoi git push'


# Alias helpers
_alias_source_file() {
  print -r -- "${CHEZMOI_ALIAS_SOURCE:-$HOME/.local/share/chezmoi/dot_alias.zsh}"
}

_reload_alias_file() {
  chezmoi apply ~/.alias.zsh || return
  source ~/.alias.zsh
}

aa() {
  if (( $# < 2 )); then
    print -u2 "usage: aa NAME COMMAND"
    print -u2 "example: aa ll 'ls -lah'"
    return 2
  fi

  local name="$1"
  shift

  if [[ ! "$name" =~ '^[A-Za-z_][A-Za-z0-9_]*$' ]]; then
    print -u2 "invalid alias name: $name"
    return 2
  fi

  local command="$*"

  python3 - "$(_alias_source_file)" "$name" "alias ${name}='${command}'" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1]).expanduser()
name = sys.argv[2]
definition = sys.argv[3]
lines = path.read_text().splitlines()
pattern = re.compile(rf"^alias\s+{re.escape(name)}=")
out = []
replaced = False

for line in lines:
    if pattern.match(line):
        if not replaced:
            out.append(definition)
            replaced = True
        continue
    out.append(line)

if not replaced:
    insert_at = len(out)
    for i, line in enumerate(out):
        if line.strip() == "# Session aliases":
            insert_at = i + 1
            while insert_at < len(out) and out[insert_at].startswith("alias "):
                insert_at += 1
            break
    out.insert(insert_at, definition)

path.write_text("\n".join(out) + "\n")
PY

  _reload_alias_file
}

ad() {
  if (( $# != 1 )); then
    print -u2 "usage: ad NAME"
    return 2
  fi

  local name="$1"

  python3 - "$(_alias_source_file)" "$name" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1]).expanduser()
name = sys.argv[2]
pattern = re.compile(rf"^alias\s+{re.escape(name)}=")
lines = path.read_text().splitlines()
path.write_text("\n".join(line for line in lines if not pattern.match(line)) + "\n")
PY

  unalias "$name" 2>/dev/null || true
  _reload_alias_file
}

al() {
  python3 - "$(_alias_source_file)" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1]).expanduser()
for line in path.read_text().splitlines():
    if re.match(r"^alias\s+", line):
        print(line)
PY
}

# Update all
ua() {
    echo "==> Authenticating..."
    sudo -v || return 1

    echo "==> Updating Homebrew..."
    brew update
    brew upgrade --greedy
    brew cleanup

    echo "==> Updating Mise-en-place..."
    mise self-update
    mise upgrade --global --bump

    echo "==> Upgrading process finished."
}

# Override lazygit behavior using SHIFT + Q instead of q
function lg() {
  export LAZY_NEW_DIR_FILE=~/.lazygit/newdir

  lazygit "$@"

  if [ -f "$LAZY_NEW_DIR_FILE" ]; then
    cd "$(cat $LAZY_NEW_DIR_FILE)"
    rm -f "$LAZY_NEW_DIR_FILE" > /dev/null
  fi
}

cr() {
    if ! chezmoi re-add; then
        echo "Error: chezmoi re-add failed."
        return 1
    fi

    until chezmoi git push; do
        printf "Push failed. Retry? [Y/n] "
        read -r answer

        case "$answer" in
            [nN]*)
                echo "Push cancelled."
                return 1
                ;;
        esac
    done
}


# Fzf aliases
all() {
  command find / -type f 2>/dev/null | fzf --preview 'bat --color always {}'
}

home() {
  command find "$HOME" -type f 2>/dev/null | fzf --preview 'bat --color always {}'
}

manf() {
  local cmd
  cmd=$(whence -pm '*' | sort -u | fzf --preview 'man {} 2>/dev/null') || return
  [[ -n "$cmd" ]] || return
  man "$cmd" | fzf
}


# FFMPEG
encode_mp4() {
  local f
  for f in "$@"; do
    ffmpeg -i "$f" \
      -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
      -c:v libx264 \
      -crf 18 \
      -preset medium \
      -pix_fmt yuv420p \
      -c:a aac \
      -b:a 192k \
      "${f:r}.mp4"
  done
}
