# ==========================================
# ===   THIS IS MY ZSHELL CONFIG FILE    ===
# ==========================================

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"


# ====================
# ===   Exports    ===
# ====================

export MANPATH="/usr/local/man:$MANPATH"

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='vim'
fi


# =============================
# ===   General settings    ===
# =============================

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# ============================================
# ===   Completion and Highlight styles    ===
# ============================================

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_COLORIZE_STYLE="colorful"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor line main pattern root url)
ZSH_HIGHLIGHT_URL_HIGHLIGHTER_TIMEOUT=1

#ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'  
#ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,underline'
#ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=blue'

zstyle ':autocomplete:list-choices:*' max-lines 40%
zstyle ':autocomplete:*' groups always
zstyle ':autocomplete:space:*' magic correct-word expand-history
zstyle ':autocomplete:tab:*' completion cycle


# ====================
# ===   Plugins    ===
# ====================
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	bgnotify
	colored-man-pages
	colorize
	common-aliases
#	copypath
#	copyfile
#	dircycle
	extract
	git
	gitignore
	history
	sudo
	zsh-autosuggestions
	zsh-syntax-highlighting
)


# ======================================
# ===   Execute initializaion        ===
# ===   Needs to be after 'plugins'  ===
# ======================================

source $ZSH/oh-my-zsh.sh


# ====================
# ===   OCI-CLI    ===
# ====================

[[ -e "~/.local/lib/oracle-cli/lib/python3.11/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "~/.local/lib/oracle-cli/lib/python3.11/site-packages/oci_cli/bin/oci_autocomplete.sh"


# =============================
# ===   Personal Aliases    ===
# =============================

source ~/.aliases


# =========================
# ===   Fuzzy Finder    ===
# =========================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# =================
# ===   Other   ===
# =================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable kubectl auto-completion
source <(kubectl completion zsh)
