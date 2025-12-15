#!/usr/bin/env zsh

# _givensuman.zsh-theme
# a tidy lil zsh theme

# Set required options
setopt prompt_subst

# Load required modules
autoload -Uz vcs_info

# Set vcs_info parameters
zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' formats "$FX[bold]%r$FX[no-bold]/%S" "%b" "%%u%c"
zstyle ':vcs_info:*:*' actionformats "$FX[bold]%r$FX[no-bold]/%S" "%s:%b" "%u%c (%a)"
zstyle ':vcs_info:*:*' nvcsformats "%~" "" ""

# Display information about the current working directory
dir_information() {
  echo "\033[1;34m${vcs_info_msg_0_%%/.}\033[0m "
}

# Fastest possible way to check if repo is dirty
git_dirty() {
  # Check if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  # Check if it's dirty
  command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo " 󰓦"
}

# Display information about the current repository
repo_information() {
  if [ -z "$vcs_info_msg_1_" ]; then
    return
  fi

  echo "\033[2;32min  $vcs_info_msg_1_$(git_dirty)\033[0m%f "
}

# Displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
    local stop=`date +%s`
    local start=${cmd_timestamp:-$stop}
    let local elapsed=$stop-$start
    [ $elapsed -gt 5 ] && echo "\033[2;33mtook  ${elapsed}s\033[0m "
}

# Display information about the virtual environment and override default 
export VIRTUAL_ENV_DISABLE_PROMPT=1
venv_information() {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "\033[2;35mvia  $(basename $VIRTUAL_ENV)\033[0m "
}

# Get the initial timestamp for cmd_exec_time
preexec() {
    cmd_timestamp=`date +%s`
}

# Output additional information about paths, repos and exec time
precmd() {
    setopt localoptions nopromptsubst
    vcs_info # Get version control info before we start outputting stuff
    print -P "\n$(dir_information)$(repo_information)$(venv_information)$(cmd_exec_time)"
    unset cmd_timestamp # Reset cmd exec time
}

# Define prompts
ICON=${ZSH_THEME_PROMPT_ICON:-"󰄛"}
COLOR=${ZSH_THEME_PROMPT_COLOR:-"blue"}
PROMPT="%(?.%F{${COLOR}}.%F{red})${ICON}%f " # Display a red prompt char on failure
RPROMPT="%F{8}${SSH_TTY:+%n@%m}%f" # Display username if connected via SSH

# ------------------------------------------------------------------------------
#
# List of vcs_info format strings:
#
# %b => current branch
# %a => current action (rebase/merge)
# %s => current version control system
# %r => name of the root directory of the repository
# %S => current path relative to the repository root directory
# %m => in case of Git, show information about stashes
# %u => show unstaged changes in the repository
# %c => show staged changes in the repository
#
# List of prompt format strings:
#
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
#
# ------------------------------------------------------------------------------
