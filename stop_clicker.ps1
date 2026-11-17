# stop_clicker.ps1
# Script to immediately terminate common auto-clicker processes on Windows

$clickerProcesses = @(
    "AutoClicker",
    "OPAutoClicker",
    "SpeedAutoClicker",
    "AutoHotkey",
    "FastClicker",
    "GSAutoClicker"
)

$found = 0
foreach ($name in $clickerProcesses) {
    $procs = Get-Process -Name $name -ErrorAction SilentlyContinue
    if ($procs) {
        foreach ($p in $procs) {
            Write-Host "Terminating process: $($p.Name) (PID: $($p.Id))..."
            Stop-Process -Id $p.Id -Force
            $found++
        }
    }
}

if ($found -eq 0) {
    Write-Host "No standard auto-clicker processes found running."
} else {
    Write-Host "Terminated $found auto-clicker process(es)."
}
