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

export WORKING_DIR=$HOME/work
mkdir -p $WORKING_DIR/ccache

export CCACHE_DIR=$WORKING_DIR/ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export LC_ALL=C
alias initrepox86='repo init -u git://git.osdn.net/gitroot/android-x86/manifest -b $1' 
alias syncrepox86='repo sync --no-tags --no-clone-bundle'
alias setccache='./prebuilts/misc/linux-x86/ccache/ccache -M 15G'
