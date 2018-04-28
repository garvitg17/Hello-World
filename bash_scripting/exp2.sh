#!/bin/bash
read_dom() {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

while read_dom;do
	if [[ $ENTITY = "dir" ]];
		then
		read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
		if [[ $ENTITY = "name" ]];
			then
			mkdir $CONTENT
			cd $CONTENT
			read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
		fi 

	elif [[ $ENTITY = "file" ]];
		then
	     read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
	     if [[ $ENTITY = "name" ]];
	     	then
	         file_name=hello2
	         read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
	     fi
	     read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
	     if [[ $ENTITY = "size" ]];
	     	then 
	         file_size=300
	         read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
	         truncate -s $file_size $file_name
	     fi
	     read_dom < ~/Desktop/CS251/bash-scripting/160261/sample.xml
	      

	elif [[ $ENTITY = "/dir" ]];
		then
	      cd ..
	fi
	echo "$ENTITY => $CONTENT"
done < ~/Desktop/CS251/bash-scripting/160261/sample.xml



