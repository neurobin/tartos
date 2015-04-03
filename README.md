# tartos
**************************************************************
TAR archive to shell script converter
**************************************************************

The tartos script is a standalone script which converts different type of TAR archives to a single shell script (bash).
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

It can be run without installing. It can be installed by giving the install file execution permission and running it once.

How To:

    1. It can take upto three arguments, the first argument is a tar archive, 
    second one is the name of the target script file
    and third one is custom command
    Ex: tartos path_to_tar_file script_name_or_path command
    2. All of the arguments are optional
    3. It will ask for necessary arguments/info as it needs on the way.
