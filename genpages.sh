ls | grep html | xargs -I [] mv [] old/[]
cont=$(ls src/cont | grep html)
for a in $cont ;do
	cat src/header.html src/cont/$a src/footer.html>> $a
done
