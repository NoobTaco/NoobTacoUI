<#
.SYNOPSIS
    Converts a WoW Midnight (12.0+) Edit Mode profile string to a Retail compatible string.

.DESCRIPTION
    This script parses a Midnight Edit Mode profile string, filters out known Midnight-specific
    system IDs, and generates a new profile string compatible with the current Retail client.

.PARAMETER InputString
    The Midnight profile string to convert. If not provided, the script will prompt or check InputFile.

.PARAMETER InputFile
    Path to a text file containing the Midnight profile string.

.PARAMETER OutputFile
    Optional path to save the converted string.

.EXAMPLE
    .\Convert-MidnightProfile.ps1 -InputString "2 50 0 0 ..."
    
.EXAMPLE
    .\Convert-MidnightProfile.ps1 -InputFile "midnight_raw.txt" -OutputFile "retail_converted.txt"
#>

param (
    [Parameter(Mandatory=$false)]
    [string]$InputString,

    [Parameter(Mandatory=$false)]
    [string]$InputFile,

    [Parameter(Mandatory=$false)]
    [string]$OutputFile
)

# Get input content
if (-not [string]::IsNullOrWhiteSpace($InputFile)) {
    if (Test-Path $InputFile) {
        $InputString = Get-Content -Path $InputFile -Raw
    } else {
        Write-Error "Input file not found: $InputFile"
        exit 1
    }
}

if ([string]::IsNullOrWhiteSpace($InputString)) {
    $InputString = Read-Host "Please paste the Midnight profile string"
}

if ([string]::IsNullOrWhiteSpace($InputString)) {
    Write-Error "No input string provided."
    exit 1
}

try {
    # Parse the string
    $parts = $InputString.Trim() -split " "
    
    # Basic validation
    if ($parts.Count -lt 2) {
        Write-Error "Invalid profile string format."
        exit 1
    }

    $version = $parts[0]
    $numSystems = [int]$parts[1]
    
    Write-Host "Detected Version: $version"
    Write-Host "Detected System Count: $numSystems"

    $current = 2
    $newParts = @()
    $count = 0
    $removedCount = 0

    # Iterate through systems
    for ($i=0; $i -lt $numSystems; $i++) {
        if ($current + 9 -ge $parts.Count) {
            Write-Warning "Unexpected end of string at index $current"
            break
        }

        $type = $parts[$current]
        $index = $parts[$current+1]
        
        # Check exclusion criteria (Midnight-specific systems)
        # 6 2  : Unknown (New Frame?)
        # 21 -1: Unknown
        # 22 * : Unknown (New Group?)
        # 23 -1: Unknown
        
        $exclude = $false
        if ($type -eq "6" -and $index -eq "2") { $exclude = $true }
        if ($type -eq "21" -and $index -eq "-1") { $exclude = $true }
        if ($type -eq "22") { $exclude = $true }
        if ($type -eq "23") { $exclude = $true }
        
        # Capture block (10 fields per system)
        $block = $parts[$current..($current+9)]
        
        if (-not $exclude) {
            $newParts += $block
            $count++
        } else {
            $removedCount++
            # Write-Verbose "Removed System Type: $type Index: $index"
        }
        
        $current += 10
    }

    # Reconstruct string
    # We keep the version '2' (assuming standard EditMode structure prevails) 
    # but update the count.
    $finalString = "$version $count " + ($newParts -join " ")
    
    Write-Host "Conversion Complete."
    Write-Host "Original Systems: $numSystems"
    Write-Host "Removed Systems: $removedCount"
    Write-Host "New System Count: $count"
    Write-Host ""
    
    if (-not [string]::IsNullOrWhiteSpace($OutputFile)) {
        Set-Content -Path $OutputFile -Value $finalString
        Write-Host "Converted string saved to: $OutputFile"
    } else {
        Write-Host "Converted String:" -ForegroundColor Cyan
        Write-Host $finalString
    }

} catch {
    Write-Error "An error occurred during conversion: $_"
    exit 1
}
