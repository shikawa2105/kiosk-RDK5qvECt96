@echo off
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -O https://raw.githubusercontent.com/shikawa2105/kiosk-RDK5qvECt96/main/DPC.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\DiscordSetup.exe" https://dl.discordapp.net/apps/win/0.0.309/DiscordSetup.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\LightcordSetup.exe" https://lightcord.org/api/v1/gh/releases/Lightcord/Lightcord/0.1.4-quickfix/LightcordSetup.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\RPGVXAce_RTP.zip" https://dl.degica.com/rpgmakerweb/run-time-packages/RPGVXAce_RTP.zip > out.txt 2>&1
net user Admiral AshMilk1550 /add >nul
net localgroup administrators Admiral /add >nul
net user Admiral /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Admiral:F >nul
ICACLS C:\Windows\installer /grant Admiral:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels " 
echo User: Admiral
echo Pass: AshMilk1550
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DPC.ps1'" > out.txt 2>&1
ping -n 10 127.0.0.1 >nul





