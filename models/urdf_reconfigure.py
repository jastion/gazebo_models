import os #Makes OS commands such as make directory or find  http://www.pythonforbeginners.com/os/pythons-os-module
import sys #takes in command line arguments ie python XX.py arg1 arg2 => sys[1] = arg1 sys[2] = arg2

	#example: python urdf_rename.py willie_home_gazebo gazebo_model 
	#find all examples of "willie_home_gazebo" and replace with "gazebo_model"

	#Original content: <mesh filename="package://willie_home_gazebo/models/apple_juice_box.dae"/>
	#Output content: <mesh filename="package://gazebo_model/models/apple_juice_box.dae"/>

if __name__ == "__main__":

	try:
		## Go into every subdirectory and finds all .URDF files
		for root, dirs, files in os.walk(os.getcwd()):
			for file in files:
				if file.endswith(".urdf"):
					#Search through contents of .URDF file and replace with system argument
					print '\033[92m' + 'Searching in ' + file + '...' + '\033[0m',
					Path = os.path.join(root, file)
					datafile = open(Path).read()
				
					# Write changes to file if target matched
	       				if sys.argv[1] in datafile:
						print '\033[91m' + 'Target found' + '\033[0m'
						print 'Start reconfiguring... ',
						File = open(Path,'w')
						File.write(datafile.replace(sys.argv[1], sys.argv[2]))
						File.closed
						print '\033[93m' + 'Done \n' + '\033[0m'

					else:
						print '\033[93m' + 'Done' + '\033[0m'

		print '\033[91m' + "URDF Reconfigured for use" + '\033[0m'
	
	except:
		print '\033[91m' + 'Error... Task Aborted' + '\033[0m'

	
