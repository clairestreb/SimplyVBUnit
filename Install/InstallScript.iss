; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{249D663E-A119-4D35-A0F4-15821B9416E5}
AppName=SimplyVBUnit 4.0
AppVerName=SimplyVBUnit 4.0
AppPublisher=Kelly Ethridge
AppPublisherURL=https://sourceforge.net/projects/simplyvbunit/
AppSupportURL=https://sourceforge.net/projects/simplyvbunit/
AppUpdatesURL=https://sourceforge.net/projects/simplyvbunit/
DefaultDirName={pf}\SimplyVBUnit 4.0
DefaultGroupName=SimplyVBUnit 4.0
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=SimplyVBUnitSetup-4.0
Compression=lzma
SolidCompression=yes

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "binaries"; Description: "Binary Files and Project Templates"; Types: full compact custom
Name: "source"; Description: "Source Files"; Types: full custom
Name: "examples"; Description: "Example Projects"; Types: full custom

[Files]
Source: ..\Binaries\Compiled\SimplyVBUnit.Framework.dll; DestDir: {sys}; Flags: regserver; Components: binaries
Source: ..\Binaries\Compiled\SimplyVBUnit.Component.ocx; DestDir: {sys}; Flags: regserver; Components: binaries
Source: ..\Binaries\Compatibility\SimplyVBUnit.Framework.cmp; DestDir: {app}\Binary\Compatibility; Components: source
Source: ..\Binaries\Compatibility\SimplyVBUnit.Component.cmp; DestDir: {app}\Binary\Compatibility; Components: source
Source: ..\TypeLibrary\SimplyVBUnitType.tlb; DestDir: {sys}; Flags: regtypelib; Components: binaries
Source: ..\TypeLibrary\SimplyVBUnitType.odl; DestDir: {app}\TypeLibrary; Components: source
Source: ..\TypeLibrary\BuildSimplyVBUnitType.bat; DestDir: {app}\TypeLibrary; Components: source
Source: ..\Source\Projects\*; Excludes: "*.vbw"; DestDir: {code:GetProjectsDir|{app}}; Components: binaries
Source: ..\Source\*; Excludes: "*.vbw,*.config,*.oca,*.pdb"; DestDir: {app}\Source; Flags: recursesubdirs; Components: source
Source: ..\Examples\*; Excludes: "*.vbw,*.pdb,*.config"; DestDir: {app}\Examples; Flags: recursesubdirs; Components: examples
Source: readme.txt; DestDir: {app}; Flags: isreadme
Source: LICENSE.txt; DestDir: {app};

[Icons]
Name: {group}\{cm:UninstallProgram,SimplyVBUnit}; Filename: {uninstallexe}
Name: {group}\Examples; Filename: "{app}\Examples"; Components: examples;
Name: {group}\Source; Filename: "{app}\Source"; Components: source;

[Code]
var
  TemplateDir: String;

function GetClassesDir(S: String): String;
begin
  RegQueryStringValue(HKCU,'Software\Microsoft\Visual Basic\6.0', 'TemplatesDirectory', TemplateDir);
  Result := TemplateDir + '\Classes\';
end;

function GetProjectsDir(S: String): String;
begin
  RegQueryStringValue(HKCU,'Software\Microsoft\Visual Basic\6.0', 'TemplatesDirectory', TemplateDir);
  Result := (TemplateDir + '\Projects');
end;