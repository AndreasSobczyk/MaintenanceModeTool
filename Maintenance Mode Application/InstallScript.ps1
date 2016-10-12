

$Path = $PSScriptRoot
$DesktopFolder = $([Environment]::GetFolderPath("CommonDesktopDirectory"))
$DestinationFolder = ${env:ProgramFiles(x86)}+"\Maintenance_Mode_Tool"

if($DesktopFolder -eq $null){
    $DesktopFolder = "C:\Users\Public\Desktop"
}

if(!(Test-Path $DestinationFolder)){
    mkdir $DestinationFolder
}

#Copy Files
$Files = Get-ChildItem -Path $Path | ? {($_.Extension -eq ".exe") -or ($_.Extension -eq ".config")}
$Files | Copy-Item -Destination $DestinationFolder
$Executable = Get-ChildItem -path $DestinationFolder | ?{$_.Extension -eq ".exe"}

#Create Shortcut
$ShortcutFile = "$DesktopFolder\Maintenance Mode Tool.lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $Executable
$Shortcut.Save()


