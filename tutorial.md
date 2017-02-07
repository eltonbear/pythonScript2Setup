# Turn Python scripts to an setup file
## Method 1: Using PyInstaller and Inno Setup
Steps 1 to 3 only need to be done once

1. Install PyInstaller package through pip

    ```sh
    $ python -m pip install -U pip PyInstaller
    ```
2. Install pefile package via pip:

    ```sh
	$ python -m pip install -U pip pefile
    ```
3. Set Environmental Variables:

	Control Panel -> System and Security -> System -> Advanced system setting (left column) -> Environmental Variables -> System variables -> edit variable *Path* -> In *Variable value*, add path in the end:
	
	*;C:\AppData\Local\Programs\Python\PythonXY\Scripts* (example)
	
    The path depends on where PyInstaller (script) is installed in your computer. XY stands for the Python version.
    Now in command window, type:
    ```sh
	$ pyinstaller --version
    ```
    The result should be 3.n for a released version. If the command is not found, make sure the execution path includes the proper directory.

4. Create an executable from Python scripts
	1. In command window, cd to the directory where the Python scripts are
	2. In command window, type:
	
		```sh
		$ pyinstaller filename.py
		```
		where filename is the file name of the Python script.
	3. Once it’s completed, the executable can be found in *dist* folder in the Python script folder
    
		Alternatively, you can type: 
		```sh
		pyinstaller options ~/myproject/source/myscript.py
		```
		where *~/myproject/source/myscript.py* is the path of the script.

		##### options: 
		-w, --windowed, --noconsole: do not provide a console window for standard i/o

		-n NAME, --name NAME: Name to assign to the bundled app and spec file (default is the first script’s basename)

		For more options, click [here](https://pythonhosted.org/PyInstaller/usage.html#capturing-windows-version-data)

5. Once you have the executable, copy *vbaProject.bin* in the script folder and paste it in the application folder *dist/yourApp*
6. Test the executable by running it with some XML files to see if it works properly
7. Download Inno Setup [here](http://www.jrsoftware.org/isinfo.php) or search *Inno Setup* online
8. Run Inno Setup. You can refer to the sample .iss script *OLPEXE.iss* in the repository 

## Method 2: Using WinPython and Inno Setup
1. Download WinPython [here](https://sourceforge.net/projects/winpython/) or search WinPython online
2. Create a folder named *MyApplication* somewhere in your computer. This folder will eventually be copied to *C:\Program Files\MyApplication* (for example) by the installer
3. Install WinPython into, for instance, *MyApplication\WinPython-64bit-w.x.y.z* (w, x, y, z are the version numbers)

    WinPython contains a GUI called *WinPython Control Panel* which allows you to install/uninstall Python packages. (In *WinPython-64bit-w.x.y.z* folder) There are lots of packages already built in. You can remove those you don't need and add new Python packages. Reference [here](http://cyrille.rossant.net/create-a-standalone-windows-installer-for-your-python-application/).
    
    For example, HKOLP requires Python packages below:
    * XlsxWriter - might have already been installed by WinPython
    * openpyxl

    Alternatively, you can install packages through *WinPython Command Prompt* or *WinPython Powershell Prompt* (in *WinPython-64bit-w.x.y.z* folder) by typing:
    ```sh
	$ python -m pip install -U pip packageName
    ```

    Note that if you don't uninstall packages that you don't need. The size of the application and the setup file will become really large. The time it takes to build a setup file is also longer.
4. Place all the requried scripts for this applcation in, for example, *WinPython-64bit-w.x.y.z\python-a.b.c.efg64\Lib\site-packages\HKOLP*. You can also have the scripts somewhere directly in your application folder, not necessarily in Python *site-packages*. You just need to specify the correct paths for *WorkingDir* and *Parameters* under *[Icons]* section in the .iss script. (see step 6 and refer to the sample script *OLPScript.iss* in the repository)
5. Download and install Inno Setup [here](http://www.jrsoftware.org/isinfo.php)
6. Run Inno Setup. You can use the wizard to create a new installer file (.iss file) or write a .iss file from scratch 

