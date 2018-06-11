Write-Output "Hello World! -- written remote script downloaded from github"

Start-Process winword.exe C:\Users\IEUser\Downloads\malicious_documents_samples\malicious_document_macro_dridex\dridexDropper.doc

Start-Sleep -Seconds 5
ps C:\Users\IEUser\scripts\enable.ps1

Start-Sleep -Seconds 10

Write-Output "Goodbye World -- remote execution complete"
