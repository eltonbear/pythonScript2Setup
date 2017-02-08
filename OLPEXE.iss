; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; Initialize all constants
#define MyAppName "HKOLP"
#define MyAppVersion "HKOLP1.5"
#define MyAppPublisher "EltonBear"
#define MyAppExeName "HKOLP.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{54004617-6062-41A4-ABD0-3862E56655D1}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}; The default name of the folder that is installed
; pf is the path of the system's Program Files directory (see help, constants)
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
; Where to output this setup file
OutputDir=D:\Elton Bear\Desktop\hkolpExeSetup
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
;It defines all of the user-customizable tasks Setup will perform during installation. These tasks appear as check boxes and radio buttons on the Select Additional Tasks wizard page.
; The line below asks if user wants to create a desktop shortcut
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; This section copys the application folder to a destination where you want to install the applcation
; {app} is the application directory, which the user selects on the Select Destination Location page of the wizard.
; The line below copys the entire HKOLP folders and its subfolders (see Flags) because the executable needs all files in the this folder to run. (* is needed)
Source: "D:\Elton Bear\Desktop\HKOLP\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
; This section creates application icons (shortcuts). First one creates an icon in "c: programs" with a name call MyAppName = "HKOLP". The second line creates an icon on desktop if user selects to create one.
; Both shortcuts run the file at "{app}\dist\HKOLP\HKOLP" (see Filename) with an working directory at "{app}\dist\HKOLP". IconFilename gives a pic for the icon with a correct path of the picture. Icon picture is an .ico file. WorkingDir is not needed in this case. 
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\dist\{#MyAppName}\{#MyAppExeName}"; WorkingDir: "{app}\dist\{#MyAppName}"; IconFilename: "{app}\picture\icon.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\dist\{#MyAppName}\{#MyAppExeName}"; WorkingDir: "{app}\dist\{#MyAppName}"; IconFilename: "{app}\picture\icon.ico"; Tasks: desktopicon

[Run]; It specifies any number of programs to execute after the program has been successfully installed.; The line below runs the application just installed. This section is optional.
Filename: "{app}\dist\{#MyAppName}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

