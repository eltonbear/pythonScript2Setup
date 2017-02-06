# Turn python script to an setup file
## Method 1: using pyinstaller
Steps 1 to 3 only need to be done once

1. Install pyinstaller package through pip 
    ```sh
    $ python -m pip install -U pip pyinstaller
    ```
2. Install pefile package via pip:
    ```sh
	$ python -m pip install -U pip pefile
    ```
3. Set Environmental Variables:

	Control Panel -> System and Security -> System -> Advanced system setting -> Environmental Variables
	Under system variables, edit variable “Path”. In “Variable value”, add path in the end:
	
	;C:\AppData\Local\Programs\Python\PythonXY\Scripts
	
    The path depends on where pyinstaller (script) is installed in your computer. XY stands for the python version.
    Now in command window, type:
    ```sh
	$ pyinstaller --version
    ```
    The result should be 3.n for a released version. If the command is not found, make sure the execution path includes the proper directory.

4. Create an executable from Python scripts
    a.	In command window, cd to the directory where the python scripts are
    b.	In command window, type:
    ```sh
    $ pyinstaller filename.py
    ```
    where filename is the file name of the Python script
    c.	Once it’s completed, the executable can be found in *dist* folder in the Python script folder
    
    Alternatively, you can type: 
    ```sh
    pyinstaller options ~/myproject/source/myscript.py
    ```
    where *~/myproject/source/myscript.py* is the path of the script.
    
    ##### options: 
    -w, --windowed, --noconsole: do not provide a console window for standard i/o
    -n NAME, --name NAME: Name to assign to the bundled app and spec file (default is the first script’s basename)
    
    For more options, click [here](https://pythonhosted.org/PyInstaller/usage.html#capturing-windows-version-data)

5. Once you have the exe file, copy *vbaProject.bin* in the script folder to the executable folder *dist/yourApp*
6. Test the executable by running it with some XML files to see if it works properly
7. Download Inno Setup [here](http://www.jrsoftware.org/isinfo.php) or search *Inno Setup* online
8. Run Inno Setup and you can refer to the example .iss script file*OLPEXE.iss* 
