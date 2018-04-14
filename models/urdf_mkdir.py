import os #Makes OS commands such as make directory or find  http://www.pythonforbeginners.com/os/pythons-os-module
import sys #takes in command line arguments ie python XX.py arg1 arg2 => sys[1] = arg1 sys[2] = arg2

#This file will find all URDF files in the current directory and move each URDF into its own individual directory.
#Example python urdf_mkdir.py

#sample.urdf
#create new directory named "sample"
#in "sample" directory, create subdirectories labelled "config" "launch" "meshes" "textures" "urdf" 
#move sample.urdf file into "sample" directory in the "urdf" subdirectory

if __name__ == "__main__":
	try: 
		# Parameters for subdirectories
		Name_of_subdirectories = ['config','meshes','launch','textures','urdf']

		for file in os.listdir(os.getcwd()):
	    		if file.endswith(".urdf") or file.endswith(".dae") or file.endswith(".xacro"):
				# Necessary parameters
				Path_to_File     = os.path.join(os.getcwd(),file)
				Name_of_File     = os.path.splitext(Path_to_File)[0]
				Path_to_Folder   = os.path.join(os.getcwd(),Name_of_File)
				New_Path_to_File = os.path.join(Path_to_Folder,'urdf',file)

				# Show informations	
	       			print '\033[92m' + 'File Matched... ' + Path_to_File + '\033[0m'
			
				# Make directory if it's not exist
				if not os.path.exists(Path_to_Folder):
					print 'Creating directroy and subdirectories...',
					# Create directroy
					os.makedirs(Path_to_Folder)

					#Create subdirectories
					for Name in Name_of_subdirectories:
						os.makedirs(os.path.join(Path_to_Folder,Name))

					print '\033[93m' + 'Completed' + '\033[0m'

				#Move urdf file into "sample/urdf" subdirectory
				print 'Transporting target file to directroy...',
				os.rename(Path_to_File,New_Path_to_File)
				print '\033[93m' + 'Completed \n' + '\033[0m'

		print '\033[91m' + "URDF Organization Completed" + '\033[0m' 

	except:
		print '\033[91m' + "Error" + '\033[0m'
	
