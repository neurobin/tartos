# tartos
**************************************************************
TAR to shell script 
**************************************************************

The tartos script is a standalone bash shell script which binds different type of TAR archives to a single shell script (bash).
This kind of approach is generally adopted to make a single install scipt from an existing tar archives with executable or installable software.
It can be used to make a self extracting archive/installer which does some additional jobs like installing softwares, compared to
the conventional tar archive files. The tartos script itself is written in bash and thus depends on it and on the package tar.

# Supported TARs:

    .tar
    .tar.lz
    .tar.lzo
    .tar.lzma
    .tar.gz
    .tar.xz
    .tar.bz2
    
    
# Install:

From source:

    It can be installed by giving the "install" file execution permission and running it in terminal.

For Ubuntu:

    sudo apt-add-repository -y ppa:neurobin/ppa
    sudo apt-get update
    sudo apt-get install tartos

# Usage:

```bash
tartos archive scriptname
```

# Advanced usage:

```bash
tartos archive scriptname "commands" -o outputdir
```

outputdir is a directory which will be bound inside the shell script so that
whent the script runs the erntire content will be put in that directory. It can be a install directoy like `/opt` , `/usr/local` etc..

1. It can take upto four arguments, the first argument is a tar archive, second one is the name of the target script file, third one is custom command and the 4th argument is `[-o outdir]`
2. `[-o outdir]` can take any position as long as the sequence of the first three argument is maintained. `-o` and `-O` is equivalent 
2. output directory can be specified without `-o` too. In that case all the arguments are mandatory.
3. It will ask for necessary arguments/info as it needs on the way.
4. Give commands inside quotation mark: double quotation is recommended
5. Best way of giving custom command is to write them in another script and put that script as a command into tartos command input. This script should reside in the tar archive itself and thus will be run after the archive is extracted (works like a post extract hook).

# Examples:
First form:
```bash
~$ tartos
Enter the path of the tar archive: 
```
Second form:
```bash
tartos *.tar.bz2 install-me.sh
```
Third form:
```bash
tartos *.tar.bz2 install-me.sh './internal-installer.sh'
```

Fourth form:
```bash
tartos -o outputdir *.tar.bz2 install-me.sh "./internal-installer.sh"
```

Fifth form:
```bash
tartos *.tar.xz install-me.sh "./internal-installer.sh" outdir
```

Source: http://github.com/neurobin/tartos

Webpage: http://neurobin.github.io/tartos

Project maintainer and author: Jahidul Hamid <jahidulhamid@yahoo.com>
