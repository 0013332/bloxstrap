# JesterBloxx Transformation Script
# This script automates namespace replacements and file renaming

param(
    [string]$ProjectRoot = ".",
    [switch]$DryRun = $false
)

Write-Host "🎭 JesterBloxx Transformation Tool" -ForegroundColor Magenta
Write-Host "=" * 50
Write-Host ""

if ($DryRun) {
    Write-Host "⚠️  Running in DRY RUN mode - no changes will be made" -ForegroundColor Yellow
    Write-Host ""
}

# Define replacements
$replacements = @(
    @{
        Old = "namespace Bloxstrap"
        New = "namespace JesterBloxx"
        Pattern = "\.cs$"
        Description = "C# namespaces"
    },
    @{
        Old = "clr-namespace:Bloxstrap"
        New = "clr-namespace:JesterBloxx"
        Pattern = "\.xaml$"
        Description = "XAML namespaces"
    },
    @{
        Old = 'using Bloxstrap'
        New = 'using JesterBloxx'
        Pattern = "\.cs$"
        Description = "Using statements"
    },
    @{
        Old = "Bloxstrap.Models"
        New = "JesterBloxx.Models"
        Pattern = "\.xaml$"
        Description = "Model references in XAML"
    }
)

$totalChanges = 0

foreach ($replacement in $replacements) {
    Write-Host "Looking for: $($replacement.Description)" -ForegroundColor Cyan
    Write-Host "  Pattern: $($replacement.Old)" -ForegroundColor Gray
    Write-Host ""
    
    $files = Get-ChildItem -Path $ProjectRoot -Recurse -Include "*" | 
             Where-Object { $_.FullName -match $replacement.Pattern -and -not ($_.FullName -match "\\bin\\|\\obj\\") }
    
    foreach ($file in $files) {
        $content = Get-Content $file.FullName -Raw
        
        if ($content -match [regex]::Escape($replacement.Old)) {
            $changeCount = ($content | Select-String -Pattern [regex]::Escape($replacement.Old) -AllMatches).Matches.Count
            Write-Host "  ✓ $($file.Name): $changeCount occurrences" -ForegroundColor Green
            $totalChanges += $changeCount
            
            if (-not $DryRun) {
                $newContent = $content -replace [regex]::Escape($replacement.Old), $replacement.New
                Set-Content -Path $file.FullName -Value $newContent
            }
        }
    }
}

Write-Host ""
Write-Host "=" * 50
Write-Host "Total replacements: $totalChanges" -ForegroundColor Cyan

if ($DryRun) {
    Write-Host ""
    Write-Host "Run without -DryRun to apply changes:" -ForegroundColor Yellow
    Write-Host "  .\Transform-JesterBloxx.ps1" -ForegroundColor Magenta
} else {
    Write-Host "✅ Transformation complete!" -ForegroundColor Green
}
