# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# Set per OS I use
#
if [[ $(uname) == "Darwin" ]]; then # MAC OSX
	export ZSH="/Users/Hywel/.oh-my-zsh"
        # User configuration
        export JAVA_HOME=$(/usr/libexec/java_home -v 17)
        PATH="/opt/homebrew/bin:$PATH"
elif command -v freebsd-version > /dev/null; then # FreeBSD
	export ZSH="/home/hywel/.oh-my-zsh"
        # Load powerline package from python
        . /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh
        export JAVA_VENDOR=openjdk
        export JAVA_HOME=/usr/local/openjdk17

        # Install Ruby Gems to ~/gems
        export GEM_HOME="$HOME/gems"

        export PATH="$HOME/gems/bin:$PATH"
else
	echo 'Unable to detect Operating System to apply correct ZSH config path'
fi
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="steeef"
# auto complete 
zstyle ':completion:*' menu select
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        # Version Control
        git
        # Programming Languages & Tools
        python
        # Productivity Boosters
        extract
        z
        history
        command-not-found
        vscode
)

source $ZSH/oh-my-zsh.sh


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# Development user configuration
export JAVA_VERSION=17
export BLOOP_JAVA_OPTS="-XX:+UseG1GC"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [-e ~/.yaul.env ]
        source ~/.yaul.env
fi

if [ -e ~/.secrets ]; then
	source ~/.secrets
fi

if [ -e ~/.Playdate/config ]; then
	export PLAYDATE_SDK_PATH=$(egrep '^\s*SDKRoot' ~/.Playdate/config | head -n 1 | cut -c9-)
fi

if [ -e ~/.config/sway ]; then
        alias insomniac='pkill -STOP swayidle' # Prevent sway from putting the machine to sleep

        if tty | grep -q '/dev/ttyv0'; then
                sway -c ~/.config/sway/config
        fi
fi

PATH="/usr/local/bin:$PATH"
