# zinit dir
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# if no zinit => install zinit
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source zinit
source "${ZINIT_HOME}/zinit.zsh"

# tpm
#TPM_HOME="$HOME/.tmux/plugins/tpm"
#if [ ! -d "$TPM_HOME" ]; then
#	git clone https://github.com/tmux-plugins/tpm.git "$TPM_HOME"
#fi
#export TPM_HOME=$TPM_HOME

# starship
zinit ice as"command" from"gh-r" \
	atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
	atpull"%atclone" src"init.zsh"
zinit light starship/starship

export STARSHIP_CONFIG=${HOME}/.config/starship/starship.toml

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::git
zinit snippet OMZP::gitignore
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::alias-finder
zinit snippet OMZP::golang
zinit snippet OMZP::lol

# load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# completions history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion ignores case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# alias-finder
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

# aliases
alias clear="clear && fastfetch"
alias c="clear"
alias ls="ls --color"
alias ll="ls -l --color"
alias la="ls -la --color"
alias vim="nvim"
alias pnpx="pnpm dlx"
alias yeet="paru -Rcs"
alias yay="paru"
alias fastfetch="fastfetch --logo <(fortune -s | cowsay -f tux)"
alias ..="cd .."

# startup
fastfetch

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# fzf
eval "$(fzf --zsh)"

# bun completions
[ -s "/home/mikey/.bun/_bun" ] && source "/home/mikey/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOBIN="$HOME/go/bin"
export PATH="$PATH:$GOBIN"
# path
export PATH=$PATH:/home/mikey/bin

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# keybindins
bindkey -v

bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^Y" autosuggest-accept

# na esc przebinodwac losowy guznik i na tym ustawić OMZP::sudo
# na na capslocku (przebidowanym na esc) ustawic vi mode

