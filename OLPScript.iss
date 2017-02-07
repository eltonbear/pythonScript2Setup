; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
; Initialize all constants
#define MyAppName "HKOLP"
#define MyAppVersion "HKOLP1.5"
#define MyAppPublisher "EltonBear"
#define MyAppExePath "WinPython-64bit-3.5.3.0Qt5\python-3.5.3.amd64\pythonw.exe"
#define MyScriptFolder "WinPython-64bit-3.5.3.0Qt5\python-3.5.3.amd64\Lib\site-packages\HKOLP"  
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0CF5884A-15BB-435A-93CE-FA7134CC0459}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}; The default name of the folder that is installed
; pf is the path of the system's Program Files directory (see help, constants)
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes; Where to output this setup file
OutputDir=D:\Elton Bear\Desktop
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"                                                                             
[Files]
; This section copys the application folder to a destination where you want to install the applcation; {app} is the application directory, which the user selects on the Select Destination Location page of the wizard.
; The line below copys the entire HKOLPscripts folder and its subfolders (see Flags) because the executable needs all files in the this folder to run. (* is needed)
Source: "D:\Elton Bear\Desktop\HKOLPscripts\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
; This section creates application icons (shortcuts). First one creates an icon in "c: programs" with a name call MyAppName = "HKOLP". The second line creates an icon on desktop.
; Both shortcuts run the file at "{app}\WinPython-64bit-3.5.2.3\python-3.5.2.amd64\pythonw.exe" with an working directory at "{app}\WinPython-64bit-3.5.2.3\python-3.5.2.amd64\site-packages\HKOLP\scripts" where the script "interface.py"
; is. Parameter specifies the parameter for the shortcut; in this case, it's the script "interface.py". IconFilename gives a pic for the icon.
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExePath}";WorkingDir: "{app}\{#MyScriptFolder}"; Parameters: """{app}\{#MyScriptFolder}\interface.py"""; IconFilename: "{app}\picture\icon.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExePath}";WorkingDir: "{app}\{#MyScriptFolder}"; Parameters: """{app}\{#MyScriptFolder}\interface.py"""; IconFilename: "{app}\picture\icon.ico"


