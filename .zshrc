# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/platelk/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git adb aws battery boot2docker branch compleat cp docker docker-compose git gitfast git-extras github gitignore gnu-utils go golang gradle history httpie node perl pep8 python ruby sudo tmux virtualenv virtualenvwrapper)

bindkey -v

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

DEFAULT_USER=platelk

alias project="nocorrect ~/work/backend/backend-tools/project/project.sh"

export DEFAULT_USER=platelk

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/lib/dart/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/apache-maven/bin
export PATH=$PATH:~/work/backend/golibs/deploy
export PATH=$PATH:~/.pub-cache/bin

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh


## Virtual Env

export WORKON_HOME=$HOME/Envs
export PROJECT_HOME=$HOME/work
source /usr/local/bin/virtualenvwrapper.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
. <(azure --completion)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/platelk/.sdkman"
[[ -s "/home/platelk/.sdkman/bin/sdkman-init.sh" ]] && source "/home/platelk/.sdkman/bin/sdkman-init.sh"

###-begin-grind-completion-###
#
# grind command completion script
#
# Installation: grind --completion=print >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: grind --completion=print > /usr/local/etc/bash_completion.d/grind
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _grind_completion () {
    local si="$IFS"
    IFS=$'
' COMPREPLY=($(export COMP_CWORD="$COMP_CWORD" 
                           export COMP_LINE="$COMP_LINE" 
                           export COMP_POINT="$COMP_POINT" 
                           grind --completion=print -- "${COMP_WORDS[@]}" 
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _grind_completion grind
elif type compdef &>/dev/null; then
  _grind_completion() {
    si=$IFS
    compadd -- $(export COMP_CWORD=$((CURRENT-1)) 
                 export COMP_LINE=$BUFFER 
                 export COMP_POINT=0 
                 grind --completion=print -- "${words[@]}" 
                 2>/dev/null)
    IFS=$si
  }
  compdef _grind_completion grind
elif type compctl &>/dev/null; then
  _grind_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'
' reply=($(export COMP_CWORD="$cword" 
                       export COMP_LINE="$line" 
                       export COMP_POINT="$point" 
                       grind --completion=print -- "${words[@]}" 
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _grind_completion grind
fi
###-end-grind-completion-###
source ~/.autoenv/activate.sh
