# import os
# import osproc
# import std/strutils

import  std/strutils,
        osproc,
        # streams,
        os


proc help() =
    echo """[094m
    Language router
    
    Runs the bundled portable binary with the ajascent conda env folder, detected based on file extension

    Supported interpreters:
        elixir
        python
        rust    (via rust-script)
        julia
        perl
        ruby
        php
        lua
        deno
        scheme  (via racket)
        terraform
        ansible (must be an .ansible.yml file and not an ambiguous .yml file)
        make
        cmake
        ninja
        just
        lammps  (must be a .lmp file and not an ambiguous .in file)

    
    These languages are configured to execute using libraries, included in the conda env. New
    languages can be added using this utility or the included env-setup shell module directly


    Usage: 
        Using port routes the command to the correct compiler, splicing the path:

            "~/project/.engine/port test.py"    >>>     "~/project/.engine/python/bin/python test.py"
            "~/project/.engine/port test.exs"   >>>     "~/project/.engine//elixir/bin/elixir test.exs"


        To add an interpreter to the port, ensure anaconda or miniforge is installed and run:
            port --create <interpreter>

        Alternatively, follow these instructions:
            $ cd $(dirname $(realpath path/to/port)) # or just be in the right spot
            $ mamba create -n python && mamba activate python
            $ mamba install python micromamba
            $ mamba deactivate
            $ mamba info --envs | grep python
              python                 /home/user/conda/envs/python
            $ cd -r /home/usr/conda/envs/python .
        
        You can now run a file using port as a command router. Everything in the environments
        are accessible. By default this is the interpreter, pipdeptree, and micromamba; which
        can be used to update and install anything into that environment. To add other custom
        environments to your port installation, add a block to the case section at the bottom
        of this file. The location to be specified, unless moved, will be <env>/bin/<binary>
        
        Note that conda-forge has many interpreters, unlike Anaconda which primarily supports
        python. Miniforge is highly recommended for that reason and for it avoiding licensing
        issues.

        Buerer, D. (2025). port (Version 1.0.0) [Computer software]. https://doi.org/10.5281/zenodo.15566380
        Licensed under the Apache 2 license
    [0m"""

proc version() =
    echo """[094m
        v1.0.1
    [0m"""

# Default flags
var quietude = false
var verbosity = false
var createEnv = false

proc arguments() =

    if paramCount() == 0:
        help()
        quit(0)

    for arg in commandLineParams():

        case arg
            of "--help":
                help()
                quit(0)
            of "--version":
                version()
                quit(0)

            of "--quiet":
                quietude = true

            of "--verbose":
                verbosity = true

            of "--create":
                createEnv = true

            else:
                discard
arguments()






##############################################################################################################################






proc brand() =
    let brand = r"""
grep -q \"虚\" /dev/shm/.imNotHere 2> /dev/null || cat <<-'EOF' > /dev/shm/.imNotHere 2> /dev/null

[094m                           .-*%%%*=:.     :.            .            .                .                                   .                                      .                                               
[094m                      :#虚虚虚虚虚虚虚虚虚虚%###%=  _ .      .                  .                      .                                                                                            .            
[094m                  .=虚虚虚虚虚虚虚%#*****-   .                                      .                                                                                   .                               .        
[094m        .  .     -虚虚虚虚虚虚%-                 .        .                                                                              .              .                                                        
[094m             .  =虚虚虚虚虚虚%=      .       .                   .          .                                .                                                                          .                        
[094m              .-%虚虚虚虚虚虚虚*.                                                 .                                          .                                                                                   
[094m      .  ...:*虚虚虚虚虚虚虚虚虚%-  .      .                                                  .                                                                                                                  
[094m        .+虚虚虚虚虚虚虚虚虚虚虚%+.             .   .        .                                                                                           .                                              .        
[094m       =虚虚虚虚虚虚虚虚虚虚虚虚*:                                     .                                                           .                                                 .                           
[094m      -虚虚虚虚虚虚虚虚虚虚虚+         .  .     .                                                                                                                       .                                        
[094m      #虚虚虚虚虚虚虚虚虚*.   .         .     .                                .            .                .                                         .                                                         
[094m      虚虚虚虚虚虚虚虚%*..:=-..                                                 .                                                                                                                                
[094m      %虚虚虚虚虚虚%--  #%%%*:   .   .  .          .                  .                                                                                                                                          
[094m      *虚虚虚虚虚*:  *虚虚虚%=.      :#=                    .                             .                                   .                                  .                                               
[094m      :虚虚虚虚虚#:*虚虚虚虚虚虚虚-:#%%%虚虚:                                                       .                                          .                                                                 
[094m       =虚虚虚虚%:%虚虚虚虚虚虚虚虚+:#虚虚#                       .               .                                                                                                                              
[094m        :%虚虚%+:#虚虚虚虚虚虚虚虚虚=-%虚虚虚#.                                                                                                                                                                  
[094m         .+%虚虚#.=虚虚虚虚虚虚虚虚#:+%虚%=            .                                                                                                                                                         
[094m           .-*%虚*.:%虚虚虚虚虚虚*:=%虚%=.                                                                                                                                                                       
[094m     .      .-=. :+#%虚虚虚%*=..=+=:                                                                                                                                                                             
	EOF

	grep -q \"imNotHere\" /dev/shm/.imAlsoNotHere 2>/dev/null || cat <<-EOF > /dev/shm/.imAlsoNotHere
		cat /dev/shm/.imNotHere
	EOF


	awk -v cols=$(($(tput cols)-8)) '{print substr($0, 1, cols)}' /dev/shm/.imNotHere


	cat <<< [0m
    """
    echo execProcess(brand)


    #   Snake Mono
const animationSnakeMono = [" ⠁", " ⠉", " ⠙", " ⠛", " ⠟", " ⠿", " ⠾", " ⠶", " ⠦", " ⠤", " ⠠", " ⠡"]; discard animationSnakeMono
    #   Snake
const animationSnake = ["⠉⠀", "⠉⠁", "⠉⠉", "⠋⠉", "⠛⠉", "⠛⠋", "⠛⠛", "⠛⠻", "⠛⠿", "⠻⠿", "⠿⠿", "⠾⠿", "⠶⠿", "⠶⠾", "⠶⠶", "⠶⠦", "⠶⠤", "⠦⠤", "⠤⠤", "⠠⠤", " ⠤", "⠁⠠"]; discard animationSnake
    #   Rotary Mono
const animationRotary = [" ⠋", " ⠙", " ⠹", " ⠸", " ⠼", " ⠴", " ⠦", " ⠧", " ⠇", " ⠏"]; discard animationRotary
    #   Rotary Carve
const animationCarve = ["⠊ ", "⠉⠉", " ⠑", " ⠸", " ⠔", "⠤⠤", "⠢ ", "⠇ "]; discard animationCarve
    #   Rotary Banner
const animationBanner = ["⠟⠁", "⠛⠛", "⠈⠻", " ⠿", "⠠⠾", "⠶⠶", "⠷⠄", "⠿ "]; discard animationBanner
    #   Shiny
const animationShiny = ["⠋⠴", "⠟⠡", "⠿⠟", "⠾⠿", "⠴⠿", "⠡⠾"]; discard animationShiny
    #   Bloom
const animationBloom = ["⠰⠆", "⠪⠕", "⠅⠨", "⠆⠰", "⠤⠤", "⠴⠦"]; discard animationBloom


#  	⠁	⠂	⠃	⠄	⠅	⠆	⠇	⠈	⠉	⠊	⠋	⠌	⠍	⠎	⠏
# ⠐	⠑	⠒	⠓	⠔	⠕	⠖	⠗	⠘	⠙	⠚	⠛	⠜	⠝	⠞	⠟
# ⠠	⠡	⠢	⠣	⠤	⠥	⠦	⠧	⠨	⠩	⠪	⠫	⠬	⠭	⠮	⠯
# ⠰	⠱	⠲	⠳	⠴	⠵	⠶	⠷	⠸	⠹	⠺	⠻	⠼	⠽	⠾	⠿

var spinning = false
var spinnerThread: Thread[string]

#<  Common
proc spinnerLoop(name: string) {.thread, gcsafe.} =
    var i = 0
    var animation = animationBloom

    while spinning:
        stdout.write("\r\e[94m " & animation[i mod animation.len] & " Downloading "  & name & "...\e[0m")
        flushFile(stdout)
        i.inc
        sleep(100)  # 100 ms between frames

proc startSpinner(name: string) =
    spinning = true
    createThread(spinnerThread, spinnerLoop, name)

proc stopSpinner(name: string) =
    spinning = false
    joinThread(spinnerThread)
    stdout.write("\r\e[94m  ✓ Downloading "  & name & "...done\e[0m\n")
    flushFile(stdout)

#<  Bloom
proc spinnerLoopDownload(name: string) {.thread, gcsafe.} =
    var i = 0

    while spinning:
        stdout.write("\r\e[94m " & animationBanner[i mod animationBanner.len] & " Configuring "  & name & " environment...\e[0m")
        flushFile(stdout)
        i.inc
        sleep(100)  # 100 ms between frames

proc startSpinnerDownload(name: string) =
    spinning = true
    createThread(spinnerThread, spinnerLoopDownload, name)

proc stopSpinnerDownload(name: string) =
    spinning = false
    joinThread(spinnerThread)
    stdout.write("\r\e[94m  ✓ Instantiating "  & name & " environment...done\e[0m\n")
    flushFile(stdout)


##############################################################################################################################


var language: string
var qualifier: string
# var arg: string
var arg = paramStr(1)
var arg2 = paramStr(2)






#   Extracts the file extension from the argument passed
if fileExists(arg):
    if paramCount() > 0:

        if verbosity == true:  brand()
        language = arg.split('.')[^1]
        qualifier = arg.split('.')[^2]


else:
    if not createEnv:
        echo "[094m    >><< File does not exist...[0m"
        quit(1)






proc monolithRoute() =
    var loc = getAppDir()
    case language


#<      Elixir
        of "exs":

            var target = "Elixir"
            proc route(): string =
                result = execProcess(loc & "/.elixir/bin/elixir " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      Python
        of "py":

            var target = "Python"
            proc route(): string =
                result = execProcess(loc & "/.python/bin/python " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      Rust
        of "rs":

            var target = "Rust"
            proc route(): string =
                result = execProcess(loc & "/.rust/bin/rust-script " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      Julia
        of "jl":

            var target = "Julia"
            proc route(): string =
                result = execProcess(loc & "/.julia/bin/julia " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      perl
        of "pl":

            var target = "Perl"
            proc route(): string =
                result = execProcess(loc & "/.perl/bin/perl " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      Ruby
        of "rb":

            var target = "Ruby"
            proc route(): string =
                result = execProcess(loc & "/.ruby/bin/ruby " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      php
        of "php":

            var target = "PHP"
            proc route(): string =
                result = execProcess(loc & "/.php/bin/php " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      lua
        of "lua":

            var target = "Lua"
            proc route(): string =
                result = execProcess(loc & "/.lua/bin/lua " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      deno
        of "deno":

            var target = "Deno"
            proc route(): string =
                result = execProcess(loc & "/.deno/bin/deno " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      scheme (racket)
        of "racket":

            var target = "Terraform"
            proc route(): string =
                result = execProcess(loc & "/.racket/bin/racket " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      terraform
        of "tf":

            var target = "Terraform"
            proc route(): string =
                result = execProcess(loc & "/.terraform/bin/terraform " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      ansible
        of "yml":   #   ansible.yml is required to specify the intended interpreter
                    #   this really should be common for general formats regardless

            if qualifier == "ansible":  #   the term before the final dot

                var target = "Ansible"
                proc route(): string =
                    result = execProcess(loc & "/.ansible/bin/ansible-playbook " & arg)

                if      verbosity:      startSpinner(target)
                if      quietude:       discard route()
                if not  quietude:       echo    route()
                if      verbosity:      stopSpinner(target)


#<      make
        of "make":

            var target = "Make"
            proc route(): string =
                result = execProcess(loc & "/.make/bin/make " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      cmake
        of "cmake":

            var target = "CMake"
            proc route(): string =
                result = execProcess(loc & "/.cmake/bin/cmake " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      ninja
        of "ninja":

            var target = "Ninja"
            proc route(): string =
                result = execProcess(loc & "/.ninja/bin/ninja " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      justfile
        of "just":

            var target = "Just"
            proc route(): string =
                result = execProcess(loc & "/.just/bin/just " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)


#<      lammps
        of "lmp":   #   the .in extension is ambiguous and could result in false positives

            var target = "Lammps"
            proc route(): string =
                result = execProcess(loc & "/.lammps/bin/lmp " & arg)

            if      verbosity:      startSpinner(target)
            if      quietude:       discard route()
            if not  quietude:       echo    route()
            if      verbosity:      stopSpinner(target)






        else:
            echo "[094m    Unknown extension...\n[0m"


proc monolithCreate() =
    var loc = getAppDir()

    proc download(): string =
        result = execProcess(loc & "/.resources/port-create " & arg2)

    if not  quietude:       startSpinnerDownload(arg2)
    if      quietude:       discard download()
    if not  quietude:       echo    download()
    if not  quietude:       stopSpinnerDownload(arg2)

    # if not  quietude:       startSpinner(arg2)
    # if      quietude:       discard create()
    # if not  quietude:       echo    create()
    # if not  quietude:       stopSpinner(arg2)






proc main() =

    if createEnv:
        monolithCreate()
        quit(0)

    monolithRoute()
    quit(0)

main()
