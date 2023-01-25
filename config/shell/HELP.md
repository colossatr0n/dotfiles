# Sort in the same manner as Finder
`ls | sort -V -f`

# Read two lines at a time in a while loop
```sh
while read line1
do
    read line2
    echo "$line1 $line2"
done < <(ls)
```
