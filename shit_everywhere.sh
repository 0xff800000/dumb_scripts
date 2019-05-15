#!/bin/sh

get_random_str() {
	eval "$1='$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)'"
}

get_path() {
	eval "$1='$(pwd)/'"
}

# Root dir
#cd /
cd .

current_layer=(/*)
next_layer=()
rand_str=''
maxdepth=3
get_random_str rand_str
echo $rand_str

echo $current_layer

for n in {0..4}
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


echo ${next_layer[@]}
