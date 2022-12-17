#**********#
#  GLOBAL  #
#**********#
# Use the -g flag to elevate alias permissions globally (sudo).
alias -g c='clear'
alias -g cp='cp -gR'
alias -g lx='exa --icons --group-directories-first'
alias -g lxa='lx -agF'
alias -g lxd='lx -hD'
alias -g lxl='lx -glF --git'
alias -g mv='mv -g'
alias -g vim='nvim'

#****************#
#  SYSTEM (DNF)  #
#****************#
alias conf-aliases='vim ~/.zsh/aliases.zsh'
alias env-megapy='cd ~/workspaces/virtualEnvs/Ud-Python/ && pipenv shell'
alias gz-pack='tar -czvf'	                # [..archivo a crear..] [..origen de la carpeta..]
alias gz-view='tar -ztvf'	                # [..archivo a listar *.tar.gz]
alias hdd-info='sudo hdparm -I'
alias hist='history | grep'
alias j='jump'
alias kernel-version='uname -romi'
alias lan='ifconfig -a enp3s0'
alias linux-version='cat /etc/os-release'
alias lspyenv='exa --icons ~/.local/share/virtualenvs/'
alias process='ps aux | grep'
alias temp-info='watch -n 2 sensors'
alias wan='ifconfig -a wlp4s0'
alias zaliases='vim ~/.zsh/.aliases.zsh'
alias zconfig='vim ~/.zshrc'
alias zrestar='source ~/.zshrc'

#****************#
#  SYSTEM (APT)  #
#****************#
#alias d-install='sudo dpkg -i'
#alias d-remove='sudo dpkg -P'
#alias linux-version='lsb_release -a'
#alias list-upg='sudo apt list --upgradable'
#alias start-late='systemd-analyze'
#alias start-late-process='systemd-analyze blame'
#alias upd='sudo apt update'
#alias upg='sudo apt upgrade'
# *alias buscar-ip='for i in `seq 20 30`; do ping -c2 10.58.1.$i | egrep '(ttl|bytes)'; done'
# *alias setproxy='set {http,https,ftp}_proxy="http://localhost:8123"'
# *alias unsetproxy='unset {http,https,ftp}_proxy'

