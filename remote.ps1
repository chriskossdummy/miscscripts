Write-Output "Hello World! -- written remote script downloaded from github"
Start-Process calc.exe

Start-Process winword.exe C:\Users\IEUser\Downloads\malicious_documents_samples\malicious_document_macro_dridex\dridexDropper.doc

Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
[Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(1000,100)

Write-Output "Goodbye World -- remote execution complete"
