# Zummoner: The Zsh Spellbook


## Invoke the Power of the Command Line with a Whisper

Are you a seasoned sorcerer of the shell, or a fledgling apprentice seeking to master the arcane arts of Linux?  Do you find yourself weary of reciting lengthy incantations (commands) for even the simplest of tasks?  Then *Zummoner* is the grimoire you've been waiting for.

Zummoner is a Zsh plugin that allows you to *summon* the correct command for your task with a mere phrase.  Describe what you wish to accomplish, and Zummoner will consult its ancient knowledge (a Large Language Model) to conjure the precise spell (command) needed.

## Features - The Enchantments Within

* **Command Conjuration:**  Simply type your desired task in natural language, and Zummoner will generate the corresponding command.
* **System Awareness:** Zummoner understands the nature of your realm (system) by querying `uname -a` and adapts its spells accordingly. It also knows who *you* are, the current user.
* **Modern Arcana:**  Zummoner favors the latest and most potent spells – `homectl` over `adduser`, `ip` over `ifconfig`, `systemctl` and `journalctl` for system management.
* **Safety First:**  The spells Zummoner casts are carefully vetted to avoid unintended consequences. It prioritizes safe and reliable commands.
* **Adaptable to Your Lore:** Zummoner can be configured to use your preferred LLM model.
* **Seamless Integration:** Zummoner integrates directly into your Zsh shell, becoming a natural extension of your command-line mastery.

## Installation - Binding the Spirit to Your Shell

To bind the spirit of Zummoner to your Zsh shell, follow these steps:

1. **Clone the Repository:**  Venture into the digital ether and retrieve the Zummoner grimoire from its repository:

   ```bash
   git clone https://github.com/day50-dev/zummoner.git ~/.zsh/plugins/zummoner
   ```

2. **Activate the Plugin:**  Open your `.zshrc` file and add `zummoner` to the `plugins` array:

   ```zsh
   plugins=(... zummoner)
   ```

3. **Recharge Your Shell:**  Refresh your Zsh shell to imbue it with Zummoner's power:

   ```bash
   source ~/.zshrc
   ```

4. **Bind the Key:** Zummoner is bound to `^Xx` (Ctrl+x, then x) by default. If this keybinding is already in use, you will need to rebind it manually.  The plugin will warn you if this is the case.

## Usage - Uttering the Incantation

1.  Press `^Xx` (Ctrl+x, then x). This will open Zummoner, awaiting your command.
2.  Type a description of the task you wish to perform. For example: "list all files in the current directory sorted by size".
3.  Zummoner will consult its knowledge and present you with the corresponding command.
4.  Press Enter to execute the command.

## Configuration - Customizing the Ritual

* **LLM Model:**  By default, Zummoner will attempt to use a default LLM model. You can specify a different model by creating a file named `default_model.txt` in the `~/.config/io.datasette.llm/` directory and placing the model name within it.  Ensure the directory exists.

## Caveats - The Limits of Magic

* **LLM Dependency:** Zummoner relies on a Large Language Model to function.  Ensure you have a compatible LLM setup and access.
* **Network Connection:**  An active network connection is required to communicate with the LLM.
* **Command Safety:** While Zummoner strives to generate safe commands, always review the generated command before execution, especially if it involves `sudo`.  Magic can be unpredictable!
* **System Compatibility:**  Zummoner attempts to generate commands compatible with your system, but variations in Linux distributions may require adjustments.



## Contribute - Add to the Grimoire

We welcome contributions from fellow sorcerers!  Feel free to submit pull requests to enhance Zummoner's knowledge and capabilities.  Let us together expand the power of the command line!

