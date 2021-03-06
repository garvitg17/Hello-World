#!/bin/bash

echo "Please enter the number : "
read a
a=$(echo $a | sed -E 's/^0+//')

valid=0
ones_arr=( "zero"  "one"  "two"  "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen" )
tens_arr=( "" "ten" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety")

num_validate() {
	new_no=$(echo $a | grep -P '^-{0,1}[0-9]*' -o | xargs | sed -E 's/\s//g')	
	
	
	if [ $new_no = $a ] 
	then
		valid=1
	fi
	return $valid
}

expand(){
	
	
	if  [[ $1 -ge 10000000 ]] && [[ $1 -le 999999999999 ]];
	then
		expand $(($1 / 10000000))
		printf "crore "
		expand $(($1 % 10000000))
	fi

	if  [[ $1 -ge 1000000 ]] && [[ $1 -le 999999999 ]]
	then
		expand $(($1 / 100000))
		printf "lakh "
		expand $(($1 % 100000))
	fi

	if  [[ $1 -ge 1000 ]] && [[ $1 -le 999999 ]]
	then
		#echo "$(($1 / 1000))"
		expand $(($1 / 1000))
		printf "thousand "
		expand $(($1 % 1000))
	fi

	if  [[ $1 -ge 100 ]] && [[ $1 -le 999 ]]
	then
		expand $(($1 / 100))
		#echo $1
		printf "hundred "
		expand $(($1 % 100))
	fi

	if  [[ $1 -ge 20 ]] && [[ $1 -le 99 ]]
	then
		printf "${tens_arr[$(($1 / 10))]} "
		expand $(($1 % 10))
	fi
 
	if  [[ $1 -ge 0 ]] && [[ $1 -le 20 ]] 
	then
		printf "${ones_arr[$(($1 % 20))]} "
	fi
}
num_validate
if [[ $valid -eq 0 ]]
then
	echo "The number is not a valid number."
else
	if  [[ "$new_no" -gt 99999999999 ]] || [[ "$new_no" -lt 0 ]] 
	then
		echo "The number if out of range."
	fi
	expand $a
fi
echo ""
