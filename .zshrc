# Created by newuser for 5.9

function randomFetch() {
	if [ $(( $RANDOM % 8 )) = 0 ]; then
		uwufetch
	else
		fastfetch
	fi
}

# startup
randomFetch

# aliases
alias clear="clear && randomFetch"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"
alias pnpx="pnpm dlx"

# pnpm
export PNPM_HOME="/home/mikey/.local/share/pnpm"
case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# starship.rs
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/mikey/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
