Function Get-Sessions {
    Param (
        $ComputerName
    )
    $i = 0
    IF ($ComputerName) {
        $sessions = quser /server:$ComputerName
    } ELSE {
        $sessions = quser
    }
    $sessions | ForEach-Object {
        IF ($i -ne 0) {
            $_ -replace "Disc","Disconnected" -match '^[\s>]([\w\.]+)\s+(\brdp-tcp#\b\d\d|\bconsole\b|\s)\s+(\d+)\s+(\w+)\s+([\d+:\.|\bnone\b]+)\s+([\d\/\s:]+)$' | Out-Null
            $Report = "" | Select-Object ComputerName,UserName,SessionName,ID,State,IdleTime,LogonTime
            IF ($ComputerName) {
                $Report.ComputerName = $ComputerName
            } ELSE {
                $Report.ComputerName = "localhost"
            }
            $Report.UserName = $matches[1]
            $Report.SessionName = $matches[2]
            $Report.ID = $matches[3]
            $Report.State = $matches[4]
            $Report.IdleTime = $matches[5] -replace "\+"," Days, " -replace ":"," Hours and " -replace '$'," Minutes"
            $Report.LogonTime = $matches[6]
            $Report
        }
        $i++
    }
}