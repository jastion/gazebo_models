#!/bin/bash


read -p "Object Name: " objName
read -p "URDF? [y/N] " boolFile
#read -p "author: " author
#read -p "email: " email

author=${author:-michael}
email=${email:-michaelchiu300@gmail.com}
outputType=/model.config
#echo $outputType
if [ $boolFile = "N" ] || [ $boolFile = "n" ] 
	then
	echo "sdf"
	#filetype=${filetype:-sdf}
	filepath=$objName.sdf
else 
	echo "urdf"
	#filetype=${filetype:-urdf}
	filepath=urdf/$objName.urdf
fi 
#echo $filepath

if [ -z $objName ]
then
	echo "Object Name not set!"
	exit
fi

#if [ -n $1]
#then
#	echo "Path not set!"
#	exit
#fi
output="$objName$outputType"

sed -e "s/\${name}/$objName/g" template.config > $output
sed -i "s/\${author}/$author/g" $output
sed -i "s/\${email}/$email/g" $output
if [ $boolFile = "N" ] || [ $boolFile = "n" ] 
	then
	#filetype=${filetype:-sdf}
	sed -i "s/{filepath}/$objName.sdf/g" $output
	#filepath=$objName.sdf
else 
	#filetype=${filetype:-urdf
	sed -i "s/{filepath}/:urdf\/$objName.urdf/g" $output
	filepath=urdf/$objName.urdf
fi 

echo "model.config file for object $objName has been created in $output!"
