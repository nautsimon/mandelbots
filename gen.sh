pages=$(ls -S -t cont/| grep html | grep -v index.html) #lists the actual content
#-S -t so that the files are roughly in time order
#index is excluded and appended at the end to make sure it gets processed last
pages="$pages index.html"
#clears the index
rm index
for page in $pages; do
	#clears page and page.tmp
	rm $page $page.tmp
	#adds the header
	cat src/header.html >> $page.tmp

	#finds the [SETTITLE], but ignores \[SETTITLE], then filters out the [SETTITLE] part
	#the head is to make it use the last one
	title=$(cat cont/$page | grep '\[SETTITLE\]'| sed '/\\\[SETTITLE\]/d; s/\[SETTITLE\]//' | tail -n 1)
	#does the same for the date
	date=$(cat cont/$page | grep '\[SETDATE\]'| sed '/\\\[SETDATE\]/d; s/\[SETDATE\]//' | tail -n 1)

	
	#replaces \[SETTITLE] with [SETTITLE], and removes lines with legitimate [SETTITLE]s in a temporary file
	cat cont/$page | sed '/\\\[SETTITLE\]/bx; /\[SETTITLE\].*/d;:x s/\\\[SETTITLE\]/\[SETTITLE\]/' >> $page.tmp
	#same for the date
	cat $page.tmp | sed '/\\\[SETDATE\]/bx; /\[SETDATE\].*/d;:x s/\\\[SETDATE\]/\[SETDATE\]/' >> $page

	#adds the index if its the homepage currently disabled
	#if [ "$page" == "index.html" ]; then
	#	cat index >> $page
	#	rm index
	#fi
	#adds the footer
	cat src/footer.html >> $page

	#replaces \[TITLE] with [TITLE] and [TITLE] with $title, "" is used so the $ still applies

	#however that means "\\\\" becomes "\\" when passed to sed from bash, and finally interpreted as a literal \ by sed
	cat $page | sed "/\\\\\[TITLE\]/bx; s/\[TITLE\]/$title/; :x s/\\\\\[TITLE\]/\[TITLE\]/" > $page.tmp
	#same with date
	cat $page.tmp | sed "/\\\\\[DATE\]/bx; s/\[DATE\]/$date/; :x s/\\\\\[DATE\]/\[DATE\]/" > $page

	rm $page.tmp
	#adds to the index, currently disabled
	echo "<a href=\"$page\">[$title] $date</a>" >> index
done
