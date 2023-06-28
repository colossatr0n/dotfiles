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

# Find Comman
## Find files in date range
`find . -newermt "apr 01, 2022" -not -newermt "apr 30, 2022" -ls | less`

## Find files that don't contain a certain directory in their path
`find . -not -ipath "*papers*" | less`

# Image Processing
## CR2/RAW to JPG
```sh
for i in *.CR2; do sips -s format jpeg $i --out "${i%.*}.jpg"; done
```
