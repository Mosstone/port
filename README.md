    Language router
    
    Runs the bundled portable binary with the ajascent conda env folder, detected based on file extension

    Supported interpreters:
        elixir
        python
        rust    (via rust-script) (just name the environment 'rust')
        julia
        Perl
        php
        lua
        deno
        scheme  (via racket)
        terraform
        make
        cmake
        ninja
        just

    
    These languages are configured to execute using libraries, included in the conda env. New
    languages can be added using this utility or the included env-setup shell module directly


    Usage: 
        Using port routes the command to the correct compiler, splicing the path:

            "~/project/.engine/port test.py"    >>>     "~/project/.engine/python/bin/python test.py"
            "~/project/.engine/port test.exs"   >>>     "~/project/.engine//elixir/bin/elixir test.exs"


        To add an interpreter to the port, ensure anaconda or miniforge is installed and run:
            port --encode <interpreter>

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
