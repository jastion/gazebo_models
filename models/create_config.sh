#!/bin/bash

author=${author:-michael}
email=${email:-michaelchiu300@gmail.com}
outputType=/model.config

read -p "Object Name: " objName
if [ -z $objName ]
	then
	echo "Object Name not set!"
	exit
fi

if [ ! -d $objName ]
	then
  echo "Object Directory not found!"
  exit
fi

read -p "File is of type URDF? [y/N] " boolFile

if [ -z $boolFile ]
then
	echo "EMPTY"
	boolFile="y"
	read -p "Search for model in URDF directory? [y/N] " boolDir
	filetype="URDF"
elif [ $boolFile == "n" ] || [ $boolFile == "N" ] 
	then
	echo "NO"
	boolDir="n" 
	filepath=$objName.sdf
	filetype="SDF"

else [ $boolFile = "y" ] || [ $boolFile = "Y" ]
	echo "ELSE"
	read -p "Search for model in URDF directory? [y/N] " boolDir
	filetype="URDF"
fi

if [ -z $boolDir ] 
	then
		boolDir="y"
		filepath=urdf/$objName.urdf
elif [ $boolDir = "y" ] || [ $boolDir = "Y" ] 
	then
	filepath=urdf/$objName.urdf
else
	filepath=$objName.urdf
fi

#read -p "author: " author
#read -p "email: " email
 
output="$objName$outputType"

sed -e "s/\${name}/$objName/g" template.config > $output
sed -i "s/\${author}/$author/g" $output
sed -i "s/\${email}/$email/g" $output

if [ $boolFile = "N" ] || [ $boolFile = "n" ]
then 
	sed -i "s/{filepath}/$objName.sdf/g" $output
	echo sdf

else
	echo urdf
	if [ $boolDir = "N" ] || [ $boolDir = "n" ]
	then
		sed -i "s/{filepath}/$objName.urdf/g" $output
	else 

	sed -i "s/{filepath}/urdf\/$objName.urdf/g" $output
	filepath=urdf/$objName.urdf
	fi
fi 

echo "model.config file for $filetype object $objName has been created in $output!"
