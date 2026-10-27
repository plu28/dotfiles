if status is-interactive
    # Commands to run in interactive sessions can go here
    function fish_greeting
    end
    fish_default_key_bindings

    # forces the autocomplete color to be light gray
    set -U fish_color_autosuggestion "#888888" 
	set -U fish_color_user --bold "#90A0B5"
	set -U fish_color_cwd --bold "#90A0B5"

    # for java development
    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk-23.jdk

    # aliases
    alias cat=bat
    alias cd=z
    alias grep=rg


    # for android emulator
    # set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
    # set -gx ANDROID_HOME /Users/david/Library/Android/sdk

	# Gemini API Key
	set -gx GEMINI_API_KEY "AIzaSyBL4UGI2KsOeDNjtj5NYBxgX6Q-LxeYD0k"

	# Temp notes directory
	set -gx MISC_DIR "$HOME/Documents/misc/nvim"

	set -gx EDITOR nvim

    # Alias to for venv
    function venv
        source venv/bin/activate.fish
    end

    # Quick c compilation
    function qcc
        gcc -Wall -pedantic -std=c99 $argv[1].c -g -o $argv[1]
    end

    # CONFIGURATION FILE SHORTCUTS

    # fish config
    function fishconfig
        cd ~/.config/fish/ ; 
        nvim ~/.config/fish/config.fish
    end

    # nvim config
    function nvimconfig
        cd ~/.config/nvim/ ; 
        nvim ~/.config/nvim/init.lua
    end

    # firefox css config
    function foxconfig
        nvim ~/Library/"Application Support"/Firefox/Profiles/3aa9by9v.default-release/chrome/userChrome.css
    end

    # aerospace config
    function aerospaceconfig
        cd ~/.config/aerospace/ ; 
        nvim ~/.config/aerospace/aerospace.toml
    end

    # kitty config
    function kittyconfig
        cd ~/.config/kitty/ ; 
        nvim ~/.config/kitty/kitty.conf
    end

    # tmux config
    function tmuxconfig
        cd ~/.config/tmux/ ;
        nvim ~/.config/tmux/tmux.conf
    end

    # gdb config
    function gdbconfig
        cd ~/ ;
        nvim ~/.gdbinit
    end

    # ghostty config
    function ghosttyconfig
        nvim $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
    end

    # PROJECT SHORTCUTS

    # wip csc308 group project
    function wip
        set session_name wip
        cd ~/Code/gh/wip ;

        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/gh/wip" C-m \; \
                new-window \; \
                send-keys "nvim ~/Code/gh/wip" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/gh/wip; npm run backdev" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/gh/wip; npm run frontdev" C-m

        end
    end

    # doggy project
    function doggy
        set session_name doggy
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/gh/doggy" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/gh/doggy; nvim ~/Code/gh/doggy" C-m
        end
    end

    # SQL Labs
    function sqllab
        set session_name sqllab
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name "ssh voronov@unix5.csc.calpoly.edu" \; \
                send-keys "mysql -hmysql.labthreesixfive.com -P3306 -u voronov -p" C-m \; \
                split-window -h \; \
                send-keys "cd ~/Code/sql/365; nvim ." C-m 
        end
    end

    # Alias for potion shop 
    function poshin
        set session_name poshin
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/gh/centralcoastcauldrons" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/gh/centralcoastcauldrons; nvim ~/Code/gh/centralcoastcauldrons" C-m
        end
    end

    # Alias for CSC 305 Assignment
    function csc305
        set session_name csc305
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/java/305" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/java/305; nvim ~/Code/java/305" C-m
        end
    end

    # CSC 308 work
    function csc308
        set session_name csc308
        cd ~/Code/js/308 ;
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/js/308" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/js/308; nvim ~/Code/js/308" C-m
        end
    end

    # CSC 349 work
    function csc349
        set session_name csc349
        cd ~/Code/python/algos ;
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/python/algos" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/python/algos; nvim ~/Code/python/algos" C-m
        end
    end

    # CSC 357 work
    function csc357
        set session_name csc357
        cd ~/Code/c/357 ; 
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/c/357" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/c/357; nvim ~/Code/c/357" C-m
        end
    end


    # boot dev
    function bdev
        set session_name bdev
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/code/bdev " c-m \; \
                new-window \; \
                send-keys "cd ~/code/bdev; nvim ~/code/bdev" c-m
        end
    end

    # csc 453: operating systems
    function os
        set session_name os
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/c/os" c-m \; \
                new-window \; \
                send-keys "cd ~/code/bdev; nvim ~/code/bdev" c-m
        end
    end

    # site
    function site
        set session_name site
        
        if tmux has-session -t $session_name > /dev/null 2>&1
            tmux attach-session -t $session_name
        else
            tmux new-session -s $session_name \; \
                send-keys "cd ~/Code/js/personal-site" C-m \; \
                new-window \; \
                send-keys "cd ~/Code/js/personal-site; nvim ~/Code/js/personal-site" C-m
        end
    end

    pyenv init - | source
	zoxide init fish | source

end

function fcopy
    set abs (realpath $argv[1])
    osascript -e 'on run argv' \
              -e 'set the clipboard to item 1 of argv as «class furl»' \
              -e 'end run' \
              "$abs"
end

# Created by `pipx` on 2025-12-16 13:19:52
set PATH $PATH /Users/david/.local/bin
