#!/bin/bash

select input in "make 5 txt files" "Hello world" "Hello bash" "Quit";do
	case $input in
		"make 5 txt files")
			for file in {1..5}.txt
			do
				>$file
			done

			echo 5 .txt files added succesfully.
		       	;;
		"Hello world")
			echo "Hello world">1.txt
			cat 1.txt |tee {2,3,4,5}.txt > /dev/null

			echo Hello world is added to those files.
			;;
		"Hello bash")
			for file in {1..5}.txt
			do
				sed -i 's/world/bash/g' $file
			done

			echo World is replaced with bash in all of them.
			;;
		"Quit")
			break;;
		*)
			echo invalid input
	esac
done

