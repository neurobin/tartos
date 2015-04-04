# tartos
**************************************************************
TAR to shell script 
**************************************************************

The tartos script is a standalone bash shell script which binds different type of TAR archives to a single shell script (bash).
This kind of approach is generally adopted to make a single install scipt from an existing tar archives with executable or installable software.
It can be used to make a self extracting archive/installer which does some additional jobs like installing softwares, compared to
the conventional tar archive files. The tartos script itself is written in bash and thus depends on it and on the package tar.

Supported TARs:

    .tar
    .tar.lz
    .tar.lzo
    .tar.lzma
    .tar.gz
    .tar.xz
    .tar.bz2
    
    
Install:

From source:

    It can be installed by giving the "install" file execution permission and running it once in terminal.

For Ubuntu:

    sudo apt-add-repository -y ppa:neurobin/ppa
    sudo apt-get update
    sudo apt-get install tartos

Use:

    tartos archive scriptname

Advanced use:

    tartos archive scriptname "commands" -o outputdir
    outputdir is a directory which will be bound inside the shell script so that
    whent the script runs the erntire content will be put in that directory

    1. It can take upto four arguments, the first argument is a tar archive, 
    second one is the name of the target script file
    and third one is custom command and the 4th argument is of type [-o outdir]
    [-o outdir] can take any position as long as the sequence of the first three argument is maintained.
    Ex1: tartos path_to_tar_file script_name_or_path command
    Ex2: tartos archive script command -o directory
    Ex3: tartos -O directory archive script command
    -o and -O is equivalent 
    2. output directory can be specified without -o too. In that case all the arguments are mandatory
    tartos archive script "commands" outdir
    3. It will ask for necessary arguments/info as it needs on the way.
    4. Give commands inside quotation mark: double quotation is recommended
    5. Best way of giving custom command is to write them in another script and put that script
    as a command into tartos command input.
    Ex: Enter custom command or script (if any): ./mycustomscript
    if the path to the script contains space, use double quotes

Source: http://github.com/neurobin/tartos

Webpage: http://neurobin.github.io/tartos

Project maintainer and author: Jahidul Hamid <jahidulhamid@yahoo.com>
