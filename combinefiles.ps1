
#downloads all files from AGFC in GPX format

$GPXFiles = (Invoke-WebRequest https://www.agfc.com/en/fishing/where-fish/fish-attractors/).links | ? { $_.innerhtml -like "*GPX*" }

Foreach ($file in $GPXFiles) {

    $filename = ($file.href | Out-String)
    $trim = $filename.substring($filename.Length - 9).trim()
    $dest = "C:\users\John\Documents\scripts\AGFC\$trim" 
    Invoke-WebRequest -uri ($File).href -OutFile $dest

}

#Creates a new agfc master file

New-Item C:\users\John\Documents\scripts\Agfc.gpx -ItemType file -ea 0

#Grabs waypoints from each file and combines them into the master file

Foreach ($GPX in $(Get-ChildItem C:\Users\John\Documents\scripts\AGFC)) {

    $content = (get-content $GPX.fullname | select -Skip 3).replace('</gpx>', "")
    Add-Content C:\users\John\Documents\scripts\Agfc.gpx -Value $content

}



