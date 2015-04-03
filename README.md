# tartos
**************************************************************
TAR archive to shell script converter
**************************************************************

The tartos script is a standalone bash shell script which converts different type of TAR archives to a single shell script (bash).
This is geneally used in making a single install scipt from an existing tar archives with executable or installable software.
The tartos script itself is written in bash and thus depends on it and on the package tar.

Supported TARs:

    .tar
    .tar.lz
    .tar.lzo
    .tar.lzma
    .tar.gz
    .tar.xz
    .tar.bz2
    
    
Install:

Fom source:

    It can be installed by giving the "install" file, execution permission and running it once in terminal.

For Ubuntu (not available yet):

    sudo apt-add-repository -y ppa:neurobin/ppa
    sudo apt-get update
    sudo apt-get install tartos

Use:

    tartos archive scriptname

Advanced use:

    tartos archive scriptname "commands" -o output_directory_to_be_bound_in_the_script_where_it_will_extract_the_tar

    1. It can take upto four arguments, the first argument is a tar archive, 
    second one is the name of the target script file
    and third one is custom command and the 4th argument is of type [-o outdir]
    [-o outdir] can take any position as long as the sequence of the first three argument is maintained.
    Ex1: tartos path_to_tar_file script_name_or_path command
    Ex2: tartos archive script command -o directory
    Ex3: tartos -O directory archive script command
    -o and -O is equivalent 
    2. It will ask for necessary arguments/info as it needs on the way.
    3. Give commands inside quotation mark: double quotation is recommended
    4. Best way of giving custom command is to write them in another script and put that script
    as a command into tartos command input.
    Ex: Enter custom command or script (if any): ./mycustomscript
    if the path to the script contains space, use double quotes

Source: http://github.com/neurobin/tartos

Webpage: http://neurobin.github.io/tartos

Project maintainer and author: Jahidul Hamid <jahidulhamid@yahoo.com>
