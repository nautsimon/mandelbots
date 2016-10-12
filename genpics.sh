ls | grep html | xargs -I [] mv [] old/[]
cont=$(ls pics/ )
echo \<div class=\"content\"\> > src/cont/pics.html
for a in $cont ;do
	echo \<img src=\"pics/$a\"\>\</img\> >> src/cont/pics.html
done
echo \</div\> >> src/cont/pics.html
