# auto complete 
zstyle ':completion:*' menu select

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="steeef"

# Set per OS I use
if [[ $(uname) == "Darwin" ]]; then # MAC OSX
	export ZSH="$(pwd)/.oh-my-zsh"
	# User configuration
	export JAVA_HOME=$(/usr/libexec/java_home -v 11)
	PATH="/usr/local/bin:$PATH"
	PATH="/opt/homebrew/bin:$PATH"
elif command -v freebsd-version > /dev/null; then # FreeBSD All
	export ZSH="/usr/local/share/ohmyzsh/"
	# If you come from bash you might have to change your $PATH.
	# export PATH=$HOME/bin:/usr/local/bin:$PATH
	export JAVA_VERSION=17
	export JAVA_VENDOR=openjdk
	export JAVA_HOME=/usr/local/openjdk17
	export BLOOP_JAVA_OPTS="-XX:+UseG1GC"
	# XDG variables are kind of standad now for desktop environments/many ports
	export XDG_CONFIG_HOME="$HOME/.config"
	export XDG_DATA_HOME="$HOME/.local/share"
	export XDG_CACHE_HOME="$HOME/.cache"
	# Set personal aliases, overriding those provided by oh-my-zsh libs,
	# plugins, and themes. Aliases can be placed here, though oh-my-zsh
	# users are encouraged to define aliases within the ZSH_CUSTOM folder.
	# For a full list of active aliases, run `alias`.
	#
	# Example aliases
	# alias zshconfig="mate ~/.zshrc"
	# alias ohmyzsh="mate ~/.oh-my-zsh"
	alias insomniac='pkill -STOP swayidle' # Prevent sway from putting the machine to sleep
	# Install Ruby Gems to ~/gems
	export GEM_HOME="$HOME/gems"
	export PATH="$HOME/gems/bin:$PATH"
else
	echo 'Unable to detect Operating System to apply specific ZSH or environment settings'
fi

if [ -e ~/.yaul.env ]; then
	source ~/.yaul.env
fi

if [ -e ~/.secrets ]; then
	source ~/.secrets
fi

if [ -e ~/.Playdate/config ]; then
	export PLAYDATE_SDK_PATH=$(egrep '^\s*SDKRoot' ~/.Playdate/config | head -n 1 | cut -c9-)
fi

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
	# Adds file compresion agnostic extract filename command
	extract
	# Allows jumping around by using z $REGEX_PREV_DIR$
	z
	# Adds h, hl, hs (history | grep), hsi (history | grep -i)
	history
	# I think this is only working on MACOSX right now?
	command-not-found
	# Adds vsc, vsca aliases for easy vscode interaction
	vscode
	# Syntax highlighting in my terminal shell.Because? why not?
	# Need to probably setup oh-my-zsh plugin manger as it's 
	# user not core
	# zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
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

if tty | grep -q '/dev/ttyv0'; then
	sway -c ~/.config/sway/config
fi

# Set vim as the default editor
export EDITOR=vim
