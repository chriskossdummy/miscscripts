Write-Output "Hello World! -- written remote script downloaded from github"

Start-Process winword.exe C:\Users\IEUser\Downloads\malicious_documents_samples\malicious_document_macro_dridex\dridexDropper.doc

Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
Start-Sleep -Seconds 2
[Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(900,80)
Start-Sleep -Seconds 2

Write-Output "Goodbye World -- remote execution complete"
