#Run this script on a Windows PE environment as admin. eg: https://www.hirensbootcd.org/
#This script is a migration of Windows Ameliorated post script for powershell.

$systemDisk="C:" #your system disks letter on Windows PE
$backupDisk="D:" #your backup disk for the windows' files(can be same as system disk)
$users=@("user1","user2") #list of users that you want their unne

mkdir "$backupDisk\backup"

#moves Windows' garbage to your backup folder
mv "$systemDisk\Program Files\Internet Explorer" "$backupDisk\backup\Program Files\Internet Explorer"
mv "$systemDisk\Program Files\WindowsApps" "$backupDisk\backup\Program Files\WindowsApps"
mv "$systemDisk\Program Files\Windows Defender" "$backupDisk\backup\Program Files\Windows Defender"
mv "$systemDisk\Program Files\Windows Security" "$backupDisk\backup\Program Files\Windows Security"
mv "$systemDisk\Program Files\Windows Defender Advanced Threat Protection" "$backupDisk\backup\Program Files\Windows Defender Advanced Threat Protection"
mv "$systemDisk\Program Files\Windows Mail" "$backupDisk\backup\Program Files\Windows Mail"
mv "$systemDisk\Program Files\Windows Media Player" "$backupDisk\backup\Program Files\Windows Media Player"
mv "$systemDisk\Program Files (x86)\Internet Explorer" "$backupDisk\backup\Program Files (x86)\Internet Explorer"
mv "$systemDisk\Program Files (x86)\Windows Defender" "$backupDisk\backup\Program Files (x86)\Windows Defender"
mv "$systemDisk\Program Files (x86)\Windows Mail" "$backupDisk\backup\Program Files (x86)\Windows Mail"
mv "$systemDisk\Program Files (x86)\Windows Media Player" "$backupDisk\backup\Program Files (x86)\Windows Media Player"
mv Windows\System32\wua* $backupDisk\backup\Windows\System32
mv Windows\System32\wups* $backupDisk\backup\Windows\System32
mv Windows\SystemApps\*CloudExperienceHost* $backupDisk\backup\Windows\SystemApps
mv Windows\SystemApps\*ContentDeliveryManager* $backupDisk\backup\Windows\SystemApps
mv Windows\SystemApps\Microsoft.MicrosoftEdge* $backupDisk\backup\Windows\SystemApps
mv Windows\SystemApps\Microsoft.Windows.Cortana* $backupDisk\backup\Windows\SystemApps
mv Windows\SystemApps\Microsoft.XboxGameCallableUI* $backupDisk\backup\Windows\SystemApps
mv Windows\diagnostics\system\Apps $backupDisk\backup\Windows\diagnostics\system
mv Windows\diagnostics\system\WindowsUpdate $backupDisk\backup\Windows\diagnostics\system

foreach($user in $users) {
rm "$systemDisk\users\$users\AppData\Local\Temp" -Recruse -Force
}

rm "$systemDisk\Windows\Temp" -Recruse -Force
rm "$systemDisk\Windows\Prefetch" -Recruse -Force
