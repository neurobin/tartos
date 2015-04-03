#!/bin/bash
#argument analysis starts here
args=( "${@}" )
ind=0
cont=0
for arg in "${args[@]}"; do
if [[ "$arg" == -[Oo] ]] || [[ $cont == 1 ]]; then
[[ $cont > 1 ]] && echo "Invalid use of -o option, you can't use it more than once"
inarg[3]="$arg"
#echo "$ind ${inarg[((ind))]} ${inarg[3]}"
((cont++))
continue
fi
inarg[((ind))]="$arg"
#echo "$ind ${inarg[((ind))]} ${inarg[((ind))]} ${inarg[3]}"
((ind++))
done
[ "${args[4]}" != "" ] && echo "Too many arguments, stop...
If you are using commands as arguments,
try putting them in double quotes and thus constructing
a single argument altogether" && exit 0
#Checking if destination directory exists
dest="${inarg[3]}"
[[ "$dest" == "" ]] && dest="./" || mkdir -p "$dest"
[ ! -d "$dest" ] && echo "Invalid output directory, using default..." && inarg[3]="./"

#first argument is the archive
payload="${inarg[0]}"
#second argument is the script name
script="${inarg[1]}"
#third argument is custom command or script
custi="${inarg[2]}"

#pay=`cat $payload`
#Creating temporary file

tmp=__extract__$RANDOM

#Supported archives
extention=(".tar.lzo" ".tar.lz" ".tar.lzma" ".tar.xz" ".tar.gz" ".tar.bz2" 
#Don't edit the line below, add extentions above, add from left/begining
 #.tar must be the last element
".tar")

#format must be sequential
format=("--lzop" "--lzip" "--lzma" "-J" "-z" "-j" "")


#echo ${extention[((index))]}
while true
do
if [ ! -f "$payload" ]; then
read -e -p "Enter the path of the tar archive: " payload
else
echo -e "Found: $payload"
break
fi
done

index=0;

for i in ${extention[@]}; do
[ "$payload" == *"$i" ]  && break
((index++))
done

if [[ $index -eq ${#extention[@]} ]]; then
echo -e "FAILD!!!\nArchive type not supported...!!!
Try extracting the content and compressing it to a supported tar archive,
then run it again.

Supported tars:

${extention[@]}\n"
exit 0
fi

while true
do
[ "$script" != "" ] || read -e -p "Enter the name/path of the script: " script
[ "$script" == "" ] || break
done
[ "$custi" != "" ] || read -e -p "Enter custom command or script (if any): " custi

[ "$dest" == "./" ] && echo "Bound directory: Working directory" || echo "Bound directory: $dest"

printf "#!/bin/bash
PAYLOAD_LINE=\`awk '/^__PAYLOAD_BELOW__/ {print NR + 1; exit 0; }' \$0\`
tail -n+\$PAYLOAD_LINE \$0 | tar -xv ${format[((index))]} -C $dest
#This is the place to add custom command
$custi
exit 0
__PAYLOAD_BELOW__\n" > "$tmp" &&

cat "$tmp" "$payload" > "$script" && rm "$tmp" &&
chmod +x "$script" &&
echo -e "***Success*** \nScript is saved as: $script" || 
echo -e "Failed!!!\nSomething seriously went wrong..."
