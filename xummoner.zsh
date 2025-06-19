xummoner() {
  local QUESTION="$BUFFER"
  local BREW_FORMULAE=$(brew list --formula -1 2>/dev/null | paste -sd, - || echo "")
  local PROMPT="
  You are an experienced macOS and Darwin engineer with expertise in all macOS
  commands and their
  functionality across different Darwin systems.

  Given a task, generate a single command or a pipeline
  of commands that accomplish the task efficiently.
  This command is to be executed in the current shell, zsh.
  For complex tasks or those requiring multiple
  steps, provide a pipeline of commands.
  Ensure all commands are safe and prefer modern ways. For instance,
  brew instead of manual installs, launchctl instead of older service management, etc.
  Make sure that the command flags used are supported by the binaries
  usually available in the current system or shell.
  If a command is not compatible with the
  system or shell, provide a suitable alternative.

  The system information is: $(uname -a) (generated using: uname -a).
  The user is $USER.
  Never use sudo unless explicitely asked or if there is no
  other way to accomplish the given task.

  Create a command to accomplish the following task: 
  
  <question>
  $QUESTION
  </question>

  If there is text enclosed in paranthesis, that's what ought to be changed

  Output only the command as a single line of plain text, with no
  quotes, formatting, or additional commentary. Do not use markdown or any
  other formatting. Do not include the command into a code block.
  Don't include the shell itself (bash, zsh, etc.) in the command.

  Some available brew formulae:
  <available_brew_commands>
  $BREW_FORMULAE
  </available_brew_commands>
  "
  local model=''

  if [[ -r "$HOME/$config/io.datasette.llm/default_model.txt" ]]; then
    model=$(cat "$HOME/$config/io.datasette.llm/default_model.txt")
  else
    model=$(llm models default)
  fi

  BUFFER="$QUESTION ... $model"
  zle -R
  local response=$(llm "$PROMPT")
  local COMMAND=$(echo "$response" | sed 's/```//g' | tr -d '\n')
  if [[ -n "$COMMAND" ]] ; then
    BUFFER="$COMMAND"
    CURSOR=${#BUFFER}
  else
    BUFFER="$QUESTION ... no results"
  fi
}

zle -N xummoner

if ! bindkey | grep -q "\^Xx"; then
  bindkey '^Xx' xummoner
else
  echo "I'm not going to unbind ^Xx, you'll need to do this yourself"
fi
