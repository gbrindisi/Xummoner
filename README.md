
# Zummoner: ✨ The Zsh Spellbook ✨

**Invoke the power of the command line with a whisper!**

Tired of remembering complex commands? 🧙‍♂️ Zummoner is a Zsh plugin that *summons* the right command for you, using the magic of a Large Language Model (LLM). Just describe what you want to do, and Zummoner does the rest!

![440177965-01488c16-fb68-4fdb-a7ea-76e12499641d](https://github.com/user-attachments/assets/e272d159-66c9-445a-8f82-4f545a5ddae6)


## Features - The Enchantments 🪄

* **Command Conjuration:** Describe your task in plain English, and Zummoner generates the command. ✨
* **System Aware:** Knows your system (`uname -a`) and user for tailored spells. 🤖
* **Modern Magic:** Prefers modern tools like `homectl`, `ip`, `systemctl`, and `journalctl`. 🚀
* **Safety First:** Commands are vetted for reliability (but *always* review before running!). 🛡️
* **Customizable LLM:** Pick your favorite LLM model! 🧠
* **Seamless Integration:** Works directly within your Zsh shell. 🐚

## Installation - Binding the Spirit 🔗
You cann zplug, zinit, zgen it ... it's the right format orrrr manually:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/day50-dev/zummoner.git $ZSH_CUSTOM/plugins/zummoner
   ```

2. **Activate the Plugin:** Add `zummoner` to your `.zshrc` `plugins` array:

   ```zsh
   plugins=(... zummoner)
   ```

3. **Reload Your Shell:**

   ```bash
   source ~/.zshrc
   ```

4. **Keybinding:**  Zummoner uses `^Xx` (Ctrl+x, then x) by default.  It'll let you know if that key is already taken!

## Usage - Uttering the Incantation 🗣️

1. Type what you want to do (e.g., "list all files in the current directory sorted by size").
2. Press `^Xx`.
3. Zummoner will show the command!
4. Press Enter to execute. 💥

## Caveats - A Little Magic Caution ⚠️

* **LLM Required:** Zummoner needs access to [simon w's llm](https://github.com/simonw/llm).
* **Network Connection:**  Requires internet access to reach the LLM.
* **Review Commands:** Always check the generated command, *especially* if it uses `sudo`!
* **System Differences:** Commands may need tweaking depending on your Linux distribution. 

## The future!

This is a prototype [for this](https://news.ycombinator.com/item?id=44112949):

<blockquote>
 My next step is recursion and composability. I want to be able to do things contextualized. Stuff like this:

  $ echo PUBLIC_KEY=(( get the users public key pertaining to the private key for this repo )) >> .env
or some other contextually complex thing that is actually fairly simple, just tedious to code. Then I want that <as the code> so people collectively program and revise stuff <at that level as the language>.
 Then you can do this through composability like so:

 with ((find the variable store for this repo by looking in the .gitignore)) as m:
      ((write in the format of m))SSH_PUBLICKEY=(( get the users public key pertaining to the private key for this repo ))
      
or even recursively:
    (( 
      (( 
        ((rsync, rclone, or similar)) with compression 
      ))  
        $HOME exclude ((find directories with secrets))         
        ((read the backup.md and find the server)) 
        ((make sure it goes to the right path))
    ));
it's not a fully formed syntax yet but then people will be able to do something like:
    $ llm-compile --format terraform --context my_infra script.llm > some_code.tf
and compile publicly shared snippets as specific to their context and you get abstract infra management at a fractional complexity.
It's basically GCC's RTL but for LLMs.

The point of this approach is your building blocks remain fairly atomic simple dumb things that even a 1b model can reliably handle - kinda like the guarantee of the RTL.

Then if you want to move from terraform to opentofu or whatever, who cares ... your stuff is in the llm metalanguage ... it's just a different compile target.

It's kinda like PHP. You just go along like normal and occasionally break form for the special metalanguage whenever your hit a point of contextual variance
</blockquote>
