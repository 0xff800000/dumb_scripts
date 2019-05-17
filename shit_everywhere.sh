#!/bin/bash

get_random_str() {
	eval "$1='$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)'"
}

get_path() {
	eval "$1='$(pwd)/'"
}

# Root dir
start_path=*
current_layer=(*)
maxdepth=3
if [[ $# == 1 ]]
then
		current_layer=($1)
elif [[ $# == 2 ]]
then
		maxdepth=$2
		current_layer=($1)
else
		current_layer=($start_path)
fi

next_layer=()
rand_str=''
get_random_str rand_str
echo $rand_str

echo $current_layer

for n in $(seq 1 $maxdepth)
do
		echo $n

		unset next_layer
		for x in ${current_layer[@]}
		do
				#echo file $x
				typ=$(file $x)
				#echo type de fichier $typ
				if [[ $typ == *": directory" ]]
				then
						#echo cd $x
						cd $x
						current_path=''
						get_path current_path
						case $current_path in 
								/dev*)
										;;
								/boot*)
										;;
								/sys*)
										;;
								/dev*)
										;;
								/proc*)
										;;
								*)

										next_layer+=($current_path*)
										echo going in $x
										;;
						esac
				fi
		done
		unset current_layer
		current_layer=${next_layer[@]}
		echo ===========
done


