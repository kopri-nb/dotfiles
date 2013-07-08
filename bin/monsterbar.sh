ff="/tmp/monsterwm.fifo"
[[ -p $ff ]] || mkfifo -m 600 "$ff"
 
# desktop names
ds=("main" "term" "dev" "foo")
 
# layout names
ms=("T" "M" "B" "G" "F")
 
while read -t 60 -r wmout || true; do
if [[ $wmout =~ ^(([[:digit:]]+:)+[[:digit:]]+ ?)+$ ]]; then
read -ra desktops <<< "$wmout" && unset r
for desktop in "${desktops[@]}"; do
IFS=':' read -r d w m c u <<< "$desktop"
((c)) && fg="\\f4" i="${ms[$m]}" || fg="\\f3"
((u)) && w+='\f5!'
r+="$fg${ds[$d]} ${w/#0/\\f8-} \\f3:: "
done
r="${r%::*}"
fi
printf "\\\l%s\\\r%s\n" "$r\\f5[\\f3$i\\f5]" "$(date +"%F %R")"
done < "$ff" | bar &
 
# pass output to fifo
monsterwm > "$ff"