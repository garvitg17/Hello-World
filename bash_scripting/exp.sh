#!/bin/bash

indent=0
#used for indentation
pindent(){
            i=0
            while [ $i -lt $indent ];
            do
                  echo -n "   "
                  i=$(($i+1))
            done 
}
recurse(){
     cd "$1"
     total_sent=0
     total_ints=0
     for line in *
     do
           if [ -d "$line" ];
           then
                indent=$(($indent + 1))
                echo "$line-$total_sent-$total_ints"
                recurse "$line"
                


                 
           fi
     done
     for line in *
     do
           if [ -f "$line" ]
           then
                total=$(cat "$line" | grep -P '((-{0,1}[0-9]+\.?\s{0}[0-9]*)|(\.[0-9]+))\.?' -o | wc -l)
			    num_floats=$(cat "$line" | grep -P '[.|?|!]{1}[0-9]+' -o | wc -l)
			    num_ints=$(($total - $num_floats))
			    total_sent_stops=$( cat "$line" | grep -P '[.|?|!]d{0}' --color=auto -o | wc -l)
			    sentences=$(($total_sent_stops - $num_floats))
			    indent=$(($indent + 1))
			    pindent
			    echo "$line-$sentences-$num_ints"
			    indent=$(($indent - 1))
			    total_sent=$(($total_sent + $sentences))
			    total_ints=$(($total_ints + $num_ints))
           fi
     done
     cd ..   
     indent=$(($indent - 1))
}


if [ $# -eq 0 ]
then 
    echo "No directory was given,please give a directory."
elif [ $# -eq 1 ] && [ -d $1 ]
then
     echo "Directory given.."
fi     
recurse $1
     
    
