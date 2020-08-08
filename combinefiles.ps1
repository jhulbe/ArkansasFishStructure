
$string1 = '<?xml version="1.0" ?>'
$string2 = '<gpx creator="Esri" version="1.1" xalan="http://xml.apache.org/xalan" xmlns="http://www.topografix.com/GPX/1/1" xsi="http://www.w3.org/2001/XMLSchema-instance">'
$string3 = '</gpx>'

$files = (GCI C:\users\john\downloads\gpx\).name 
$savefile = "C:\users\john\downloads\gpx\master.xml"

Foreach($file in $files){
    $name = $file.replace(".gpx","")
$content = (Get-content "C:\users\john\downloads\gpx\$file") |%{
$_ -replace $string1 , ""`
-replace $string2 , ""`
-replace $string3 , ""`
-replace "<name> </name>","<name>$name</name>"
}
add-content $savefile $content
}
