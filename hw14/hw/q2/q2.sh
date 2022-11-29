#!/bin/bash
echo how many tasks do you have?
read tasks
for(( i=1 ; i<=$tasks ; i++ ));
do
	if(($i!=$tasks));
	then
		echo task $i : 10 seconds
		sleep 10

		if(($i%4==0));
		then
			echo long break : 5 seconds
			sleep 5
		else
			echo short break : 3 seconds
			sleep 3
		fi
	else
	echo task $i : 10 second
	sleep 10
	echo you did it champ.
	fi	
done	
