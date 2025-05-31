# import os
# import osproc
# import std/strutils

import  std/strutils,
        osproc,
        # streams,
        os


proc help() =
    echo """[094m
    Runs the bundled portable binary with the ajascent conda env folder

    Detects the appropriate interpreter to use based on file extension

    Supported interpreters:
        Python
        Elixir
        Rust (via rust-script)

    
    These languages are configured to execute using libraries included in the conda env. New languages
    can be added by copying the case block and exporting the correct libraries to the conda env, which
    tells the interpreter where the libraries can be found in addition (or instead of) the system path


    Usage: 
        Using port routes the command to the correct compiler, splicing the path:

            "~/project/.engine/port test.py"    >>>     "~/project/.engine/python/bin/python test.py"
            "~/project/.engine/port test.exs"   >>>     "~/project/.engine//elixir/bin/elixir test.exs"


        To add an interpreter to the port, use anaconda or miniforge:
            $ cd $(dirname $(realpath path/to/port)) # or just be in the right spot
            $ mamba create -n python && mamba activate python
            $ mamba install python micromamba
            $ mamba deactivate
            $ mamba info --envs | grep python
              python                 /home/user/conda/envs/python
            $ cd -r /home/usr/conda/envs/python .
        
        Note that conda-forge has many interpreters, besides python. Miniforge is recommended
        as it includes conda-forge and mamba by default unlike Anaconda. Including Micromamba
        is recommended for each environments so end users can install packages and update the
        interpreter if they don't have conda configured.

        Buerer, D. (2025). port (Version 1.0.0) [Computer software]. https://orcid.org/0009-0002-5084-0465
        Licensed under the Apache 2 license
    [0m"""

proc version() =
    echo """[094m
        v1.0.0
    [0m"""

# Default flags
var quietitude = false
var verbosity = false

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
                quietitude = true

            of "--verbose":
                verbosity = true

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






##############################################################################################################################


var language: string
# var arg: string
var arg = paramStr(1)






#   Scans for the file extension
if fileExists(arg):

    if paramCount() > 0:
        if verbosity == true:  brand()
        language = arg.split('.')[^1]

    # unreachable code
    # else:
    #     echo "[094m    NO FILE EXTENSION Dfgsrgrej[0m"
    #     quit(1)

else:
    echo "[094m    NO SUCH FILE DJGFHSDGJGDSJ[0m"
    quit(1)






proc main() =
    var loc = getAppDir()
    case language


#<      Elixir
        of "exs":

            proc elixirRun(): string =
                result = execProcess(loc & "/elixir/bin/elixir " & arg)

            if verbosity == true:    stdout.write("\e[94m    Executing...\e[0m")
            flushFile(stdout)
            if quietitude == true:   discard elixirRun()
            if quietitude == false:    echo elixirRun()
            if verbosity == true:    stdout.write("\r\e[94m  ✓ Executing...done\e[0m\n")


#<      Python
        of "py":

            proc pythonRun(): string =
                result = execProcess(loc & "/python/bin/python " & arg)

            if verbosity == true:    stdout.write("\e[94m    Executing...\e[0m")
            flushFile(stdout)
            if quietitude == true:   discard pythonRun()
            if quietitude == false:    echo pythonRun()
            if verbosity == true:    stdout.write("\r\e[94m  ✓ Executing...done\e[0m\n")


        else:
            echo "[094m    Unknown extension...\n[0m"

main()
