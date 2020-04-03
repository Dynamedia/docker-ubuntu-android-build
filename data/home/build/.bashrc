alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls -hFG'
alias l='ls -lF'
alias ll='ls -alF'
alias lt='ls -ltrF'
alias ll='ls -alF'
alias lls='ls -alSrF'
alias llt='ls -altrF'

alias tarc='tar cvf'
alias tarcz='tar czvf'
alias tarx='tar xvf'
alias tarxz='tar xvzf'

alias g='git'
alias less='less -R'
alias os='lsb_release -a'
alias vi='vim'

# Colorize directory listing
alias ls="ls -ph --color=auto"

# Shell
export CLICOLOR="1"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=1;40:bd=34;40:cd=34;40:su=0;40:sg=0;40:tw=0;40:ow=0;40:"


# Z
source $HOME/.scripts/z.sh

# AOSP

export USE_CCACHE=1
export LC_ALL=C

alias setccache='./prebuilts/misc/linux-x86/ccache/ccache -M 15G'

# Half of available memory for Jack
export ANDROID_JACK_VM_ARGS="-Xmx$(awk '/MemTotal/ { printf "%.0f", $2/1024/2 }' /proc/meminfo)m -Dfile.encoding=UTF-8 -XX:+TieredCompilation"