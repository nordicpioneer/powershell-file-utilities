$MriRaw = Get-ChildItem -Path 'Pathname' -Directory
$Results = foreach ($Folder in $MriRaw)
    {
    [PSCustomObject]@{
        FolderName = $Folder.FullName
        FileCount = ($Folder | Get-ChildItem -File -Recurse).count
        FolderSizeGB = ("{0:N3} GB" -f (($Folder | Get-ChildItem -File -Recurse | Measure-Object -Property Length -sum).Sum /1GB))
        }
    }
$Results|Export-Csv -Path '\Users\adrianvestol\001MRprosjekt\report-test_upload-filecount-foldersize-28-11-2020-0842.csv' -NoTypeInformation
