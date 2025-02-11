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

# Find Command

## Find files in date range

`find . -newermt "apr 01, 2022" -not -newermt "apr 30, 2022" -ls | less`

## Find files that don't contain a certain directory in their path
`find . -not -ipath "*papers*" | less`

# Image Processing

## CR2/RAW to JPG

```sh
for i in *.CR2; do sips -s format jpeg $i --out "${i%.*}.jpg"; done
```
## Convert webp to jpeg

```sh
magick image.webp image.jpeg
```

# PDF Processing

## OCR PDF
```sh
ocrmypdf --force-ocr article.pdf article.ocr.pdf
```

## Remove All Annotations from PDF
Removes all annotations (highlights, comments, notes, arrows):
```sh
pdftk in.pdf output - uncompress | LANG=C LC_ALL=C sed '/^\/Annots/d' | pdftk - output out.pdf compress
```

## Remove Some Pages from PDF
Keep onlhy pages 1-9 and 26 till end of pdf.
```sh
pdftk input.pdf cat 1-9 26-end output output.pdf
```

## Grep a PDF
```
pdftotext my.pdf - | grep 'pattern'
```

# Network
## cURL
### Get final status code after redirects
```
curl -s -L -o /dev/null -w "%{http_code}" 'https://www.website.com'
```

# Grep
# Find differences between two files and output them
Grep lines from input2 that do not match any line in input1 and treat input 1 lines as fixed strings (not regexes):
```sh
grep -vFf input1 input2 
```


[More info](https://stackoverflow.com/questions/24324350/how-to-remove-common-lines-between-two-files-without-sorting)
