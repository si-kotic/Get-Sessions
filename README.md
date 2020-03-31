# Get-Sessions
Get-Sessions retrieves details about all of the current user sessions for either the local machine or a remote server.  It allows you to see if sessions are connected/disconnected, the logon time and the amount of time a disconnected session has been idle (ie the time since the session was disconnected).

## Usage
Get-Sessions is packaged as a function, not simply a script.  Therefore you have to load the function in to your PowerShell session in order to use it.  You can do this using:
```
. c:\Path\To\Function\Get-Session.ps1
```
### Parameters
#### ComputerName
This parameter specifies the name of the computer for which you wish to retrieve the user sessions.  If it is not specified, user sessions are retrieved for the macihne on which the script is being executed.

Argument | Value
--- | ---
Type | String
Position | Named
Default value | None
Accept pipeline input | False
Accept wildcard characters | False
Mandatory | False
### Syntax
```powershell
Get-Sessions
```
```powershell
Get-Sessions -ComputerName "server01.domain.local"
```
## Example
```powershell
C:\> Get-Sessions -ComputerName "server01.domain.local"
ComputerName : server01.domain.local
UserName     : admin
SessionName  :
ID           : 2
State        : Disconnected
IdleTime     : 12 Days, 04 Hours and 19 Minutes
LogonTime    : 02/03/2020 11:46:00

ComputerName : server01.domain.local
UserName     : another.user
SessionName  :
ID           : 5
State        : Disconnected
IdleTime     : 8 Hours and 20 Minutes
LogonTime    : 17/03/2020 16:39:00
```