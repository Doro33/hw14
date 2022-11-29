#!/bin/bash
touch todo.txt
touch compelete.txt
touch delete.txt
select input in "Add a new task" "Add a task to compeleted list" "Delete a task" "Show my todo list" "Show compeleted tasks" "Show deleted tasks" "Search" "Quit";do
	case $input in
		"Add a new task")
			read -p"new task: " task
			echo $task >> todo.txt
			echo New task is added succesfully.
			;;
		"Add a task to compeleted list")
			echo Your todo list is:
			cat todo.txt
			read -p"Which task you have done? " task
			n=$(grep -c $task todo.txt)
			if (($n>0));
			then
				echo $task >> compelete.txt
				sed -i "s/$task//g" todo.txt
				sed -ir '/^\s*$/d' todo.txt
				echo Mission complete.
			else
				echo This task is not in your todo list.
			fi
			;;
		"Delete a task")
			echo Your todo list is:
			cat todo.txt
			read -p"Which task you want to delete? " task
			n=$(grep -c $task todo.txt)
			if (($n>0));
			then
				echo $task >> delete.txt
				sed  -i "s/$task//g" todo.txt
				sed -ir '/^\s*$/d' todo.txt
				echo Mission compelete.
			else
				echo This task is not in you todo list.
			fi
			;;
		"Show my todo list")
			echo Your todo list is:
			cat todo.txt
			;;
		"Show compeleted tasks")
			echo Compeleted tasks are:
			cat compelete.txt
			;;
		"Show deleted tasks")
			echo Deleted tasks are:
			cat delete.txt
			;;
		"Search")
			read -p"What are you looking for? " input
			n=$(grep -c $input *.txt)
			echo number of results: $n
			grep -n $input *.txt
			;;
		"Quit")
			break
			;;
		*)
			echo Invalid input.
			;;
	esac
done
