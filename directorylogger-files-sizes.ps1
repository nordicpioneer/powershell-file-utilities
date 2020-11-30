$Root = Get-ChildItem -Path 'Pathname' -Directory
$Results = foreach ($Folder in $Root)
    {
    [PSCustomObject]@{
        FolderName = $Folder.FullName
        FileCount = ($Folder | Get-ChildItem -File -Recurse).count
        FolderSizeGB = ("{0:N3} GB" -f (($Folder | Get-ChildItem -File -Recurse | Measure-Object -Property Length -sum).Sum /1GB))
        }
    }
$Results|Export-Csv -Path 'Report.csv' -NoTypeInformation
