# Path to your oh-my-zsh installation.
export ZSH=/Users/rajdeepvarma/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
# ENABLE_CORRECTION="true"

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
plugins=(git zsh-syntax-highlighting z)


# User configuration


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


export PATH=/Users/rajdeepvarma/Library/Android/sdk/tools:/Users/rajdeepvarma/Library/Android/sdk/platform-tools:/Users/rajdeepvarma/bin:/Users/rajdeepvarma/Library/Android/sdk/build-tools/26.0.2/:$PATH

export ANDROID_HOME=/Users/rajdeepvarma/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home/
export PRY_DEBUG=true

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

function droid_capture(){
  adb shell screencap -p /sdcard/droid_screen.png
  adb pull /sdcard/droid_screen.png
}


function f(){
  bundle exec calabash-android run artifacts/BadooApp-internal-badoo-QA.apk -p android_badoo OBFUSCATED=1 MAPPING_PATH=artifacts/BadooApp-internal-badoo-QA.mapping.txt NO_APP_INSTALL=true NO_TEST_APP_INSTALL=1 -x $@
}

function fdev(){
  cd /Users/rajdeepvarma/bma-calabash
  bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-badoo-QA.apk -p android_badoo OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-badoo-QA.mapping.txt  -t @x  NO_APP_INSTALL=true NO_TEST_APP_INSTALL=1 -x BMA_SERVER=DEV
}

function run(){
  calabash-android resign artifacts/BadooApp-internal-badoo-QA.apk

  bundle exec calabash-android run artifacts/BadooApp-internal-badoo-QA.apk -p android_badoo OBFUSCATED=1 MAPPING_PATH=artifacts/BadooApp-internal-badoo-QA.mapping.txt -x $@
}

function run_yesterday(){
  bundle exec calabash-android run /Users/rajdeepvarma/Desktop/yesterday_app/BadooApp-internal-badoo-QA.apk -p android_badoo OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/yesterday_app/BadooApp-internal-badoo-QA.mapping.txt  -t @x -x
}

function run_release(){
  bundle exec calabash-android run /Users/rajdeepvarma/Desktop/release/BadooApp-internal-badoo-QA.apk -p android_badoo OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/release/BadooApp-internal-badoo-QA.mapping.txt  -t @x -x
}


function run_hon(){
  calabash-android resign /Users/rajdeepvarma/Desktop/BadooApp-internal-hotornot-QA.apk

  bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-hotornot-QA.apk -p android_hon OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-hotornot-QA.mapping.txt -x $@
}


function f_hon(){
  NO_APP_INSTALL=true NO_TEST_APP_INSTALL=1 bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-hotornot-QA.apk -p android_hon OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-hotornot-QA.mapping.txt -x $@
}


function run_blendr(){
  calabash-android resign /Users/rajdeepvarma/Desktop/BadooApp-internal-blendr-QA.apk

  bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-blendr-QA.apk -p android_blendr OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-blendr-QA.mapping.txt -x $@
}


function f_blendr(){
  NO_APP_INSTALL=true NO_TEST_APP_INSTALL=1 bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-blendr-QA.apk -p android_blendr OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-blendr-QA.mapping.txt -x $@
}

function run_fiesta(){
  calabash-android resign /Users/rajdeepvarma/Desktop/BadooApp-internal-fiesta-QA.apk

  bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-fiesta-QA.apk -p android_fiesta OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-fiesta-QA.mapping.txt -x $@
}


function f_fiesta(){
  NO_APP_INSTALL=true NO_TEST_APP_INSTALL=1 bundle exec calabash-android run /Users/rajdeepvarma/Desktop/BadooApp-internal-fiesta-QA.apk -p android_fiesta OBFUSCATED=1 MAPPING_PATH=/Users/rajdeepvarma/Desktop/BadooApp-internal-fiesta-QA.mapping.txt -x $@
}

function fr(){
 git diff --name-only | grep '\.rb' | xargs rubocop -a
 git diff --name-only --cached | grep '\.rb' | xargs rubocop -a
}

function f_payments(){
  bundle exec calabash-android run artifacts/BadooApp-internal-badoo-QA.apk -p android_badoo_payments OBFUSCATED=1 MAPPING_PATH=artifacts/BadooApp-internal-badoo-QA.mapping.txt NO_APP_INSTALL=true NO_TEST_APP_INSTALL=1 -x $@
}


function b(){
  TEST_APP=./artifacts/bumble.apk bundle exec cucumber -p android_bumble -x $@
}

