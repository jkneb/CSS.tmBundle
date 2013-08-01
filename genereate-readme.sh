#!/bin/bash 

for FILE in $(find Snippets/ -name *.tmSnippet); 
do 
    snip=$(gawk -vRS="</string>" '/<key>/{gsub(/<key>|<string>|\n| +/,"") ; sub("</key>","=") ;print}' $FILE | grep -e "name\|tabTrigger" | tr -d \\t && echo "")
    echo -e "$snip\n" >> readme.md;
done
