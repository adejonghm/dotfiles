# ==========================================
# ===   THIS IS MY ZSHELL CONFIG FILE    ===
# ==========================================


# ==========================
# ===   LOAD ZSH THEME   ===
# ==========================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Customizing prompt. run `p10k configure` or edit ~/.zsh/p10k.zsh
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh


# ====================
# ===   Exports    ===
# ====================
export TF_VAR_ARM_CLIENT_ID=
export TF_VAR_ARM_CLIENT_SECRET=
export TF_VAR_ARM_SUBSCRIPTION_ID=
export TF_VAR_ARM_TENANT_ID=

export TF_VAR_AWS_ACCESS_KEY_ID=
export TF_VAR_AWS_SECRET_ACCESS_KEY=

export GMAIL_USERNAME=""
export GMAIL_PASSWORD=""

export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"
export MEDIA=/run/media/$USER/Storage
export PATH=$HOME/.local/bin:$PATH
export UPDATE_ZSH_DAYS=30
export ZSH="$HOME/.oh-my-zsh"

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
else
   export EDITOR='vim'
fi


# =============================
# ===   General settings    ===
# =============================
# DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


# ============================================
# ===   Completion and Highlight styles    ===
# ============================================
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_COLORIZE_STYLE="colorful"
ZSH_HIGHLIGHT_URL_HIGHLIGHTER_TIMEOUT=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets cursor line main pattern root) #url)

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
plugins=(
    bgnotify colored-man-pages colorize dircycle dnf docker extract fzf git gitignore jump kubectl kube-ps1 python ripgrep sudo systemd terraform web-search zsh-autosuggestions zsh-syntax-highlighting
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
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh


# =========================
# ===   Fuzzy Finder    ===
# =========================
if [[ ! "$PATH" == */home/$USER/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

source "$HOME/.fzf/shell/key-bindings.zsh"


# ================================
# ===   Other Configurations   ===
# ================================
# Enable kubectl auto-completion
source <(kubectl completion zsh)


# ===========================
# ===   Starship Prompt   ===
# ===========================
#[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
#eval "$(starship init zsh)"


# ========================
# ===   Ruby Version   ===
# ========================
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.0
