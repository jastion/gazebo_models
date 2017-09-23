#!/bin/bash

author=${author:-michael}
email=${email:-michaelchiu300@gmail.com}
outputType=/model.config

#read -p "Object Name: " objName
#if [ -z $objName ]
#	then
#	echo "Object Name not set!"
#	exit
#fi
if [ ! -d $1 ]
	then
  echo "Object Directory not found!"
  exit
fi

if [ ${1: -1} = "/" ] 
then
  objName=${1::-1}
else
  objName=$1
fi

output="$objName$outputType"

if [ -z "${!2}" ]
then 
	sed -e "s/\${name}/$objName/g" template.config > $output
	sed -i "s/\${author}/$author/g" $output
	sed -i "s/\${email}/$email/g" $output
	sed -i "s/{filepath}/urdf\/$objName.dae/g" $output
	filetype="dae"
	echo "model.config file for $filetype object $objName has been created in $output!"

else

	read -p "Search for model in URDF directory? [y/N] " boolDir
	filetype="dae"

	if [ -z $boolDir ] 
		then
			boolDir="y"
			filepath=urdf/$objName.dae
	elif [ $boolDir = "y" ] || [ $boolDir = "Y" ] 
		then
		filepath=urdf/$objName.dae
	else
		filepath=$objName.dae
	fi

	#read -p "author: " author
	#read -p "email: " email

	sed -e "s/\${name}/$objName/g" template.config > $output
	sed -i "s/\${author}/$author/g" $output
	sed -i "s/\${email}/$email/g" $output


	if [ $boolDir = "N" ] || [ $boolDir = "n" ]
	then
		sed -i "s/{filepath}/$objName.dae/g" $output
	else 
		sed -i "s/{filepath}/urdf\/$objName.dae/g" $output
	filepath=urdf/$objName.dae
	fi
	echo "model.config file for $filetype object $objName has been created in $output!"
fi

