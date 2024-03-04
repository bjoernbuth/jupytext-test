# Requires -Version 5.1 or higher

param (
    [String]$FilePath
)

# Check if the file path parameter has been provided
if (-not $FilePath) {
    Write-Error "No file path provided. Usage: .\scriptname.ps1 -FilePath 'path\to\file.py'"
    exit
}

# Extract filename without extension
$FileName = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)

# Convert .py to .ipynb and execute it
& jupytext --to notebook --execute $FilePath -o "$FileName.ipynb"

# Assuming 'juht' is accessible globally or specify the full path
# Replace 'juht' with the full path if it's not globally accessible
# & juht "$FileName.ipynb"

# Write-Host "Conversion completed: $FileName.html"

deactivate

jupyter nbconvert --to html "$FileName.ipynb"
