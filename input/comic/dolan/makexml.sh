find *.png *.jpg | sort -n > tmp.lst
FILECOUNT=`cat tmp.lst | wc -l`

echo '<menugroup>'
echo '<menu name="mag1">'
echo '<init>'
echo '<drawpic mutex="all">'
echo '<texture y="0" x="0" size_y="1200" size_x="825" />'
echo '<target y="0" x="0" fullupdate="clear" />'
echo '</drawpic>'
echo '</init>'

echo '<items>'

imgnum=1
for i in `cat tmp.lst`
do

	echo '<item name="'$imgnum'">'

	echo '<activation>'
	echo '<drawpic mutex="all">'
	echo '<texture image="'$i'" y="0" x="0" size_y="1200" size_x="825" />'
	echo '<target y="0" x="0" fullupdate="yes" />'
	echo '</drawpic>'
	echo '</activation>'

	echo '<key id="left">'
	if [ $imgnum -eq 1 ]
	then
		echo '<selectitem name="'$FILECOUNT'" />'
	else
		echo '<selectitem name="'$((imgnum-1))'" />'
	fi
	echo '</key>'

	echo '<key id="right">'
	if [ $imgnum -eq $FILECOUNT ]
	then
		echo '<selectitem name="1" />'
	else
		echo '<selectitem name="'$((imgnum+1))'" />'
	fi
	echo '</key>'

	echo '<key id="home">'
	if [ $imgnum -eq 1 ]
	then
		echo '<loadmenu name=".." />'
	else
		echo '<selectitem name="'1'" />'
	fi
	echo '</key>'
	echo '</item>'

	imgnum=$((imgnum+1))
done


echo '</items>'
echo '</menu>'
echo '</menugroup>'

rm tmp.lst