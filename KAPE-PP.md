# KAPE Post Processing

## Basic

Powershell CMD as Admin & Navigate to Collections folder

```powershell
kape.exe --msource .\Targets\C --mdest .\PostMortem --mflush --module CCMRUAFinder_RecentlyUsedApps,Chainsaw,hayabusa_OfflineEventLogs,DHParser,ObsidianForensics_Hindsight,SRUMDump,NirSoft_BrowsingHistoryView,NirSoft_FullEventLogView_PowerShell-Operational,NirSoft_FullEventLogView_ScheduledTasks,NirSoft_FullEventLogView_Security,NirSoft_FullEventLogView_System,!EZParser,LogParser,LogParser_RDPUsageEvents_Custom,NTFSLogTracker,RegRipper,PowerShell_Move-KAPEConsoleHost_history,PowerShell_MFTECmd_J-MFTParsing,PowerShell_Get-DoSvc4n6,EvtxHussar,NirSoft_TurnedOnTimesView,OneDriveExplorer,PowerShell_SrumECmd_SRUM-RepairAndParse --gui
```

or if it occur an error or it freezes at a state:

```powershell
kape.exe --msource .\Targets\C --mdest .\PostMortem --mflush --module CCMRUAFinder_RecentlyUsedApps,Chainsaw,hayabusa_OfflineEventLogs,DHParser,ObsidianForensics_Hindsight,SRUMDump,NirSoft_BrowsingHistoryView,NirSoft_FullEventLogView_PowerShell-Operational,NirSoft_FullEventLogView_ScheduledTasks,NirSoft_FullEventLogView_Security,NirSoft_FullEventLogView_System,!EZParser,LogParser,LogParser_RDPUsageEvents,NTFSLogTracker,RegRipper,PowerShell_Move-KAPEConsoleHost_history,PowerShell_MFTECmd_J-MFTParsing,PowerShell_Get-DoSvc4n6,EvtxHussar,NirSoft_TurnedOnTimesView,OneDriveExplorer --gui
```

## Super Timeline

```bash
C:\DFIR\Get-ZimmermanTools\net6\MFTECmd.exe -f "Targets\C\$MFT" --body "timeline" --bodyf mftecmd.body --blf --bdl C:  
```

```powershell
cd timeline
```

```bash
log2timeline.exe -z UTC --status_view window --storage_file timeline.plaso ..\Targets\C/
```

Merge Timelines:

```bash
log2timeline.exe -z UTC --status_view window --parsers 'mactime' --storage_file timeline.plaso mftecmd.body
```

Finally:

```bash
sudo psort.py -w timeline.csv -o dynamic --dynamic_time timeline.plaso "date > DATETIME('2021-12-31T00:00:01') AND date < DATETIME('2022-12-31T23:59:59')"  
```

Alternative (Full Timeframe):

```bash
psort.exe -w timeline.csv -o dynamic timeline.plaso
```



# E01

After Arsenal Mount: -> CD to Collections folder

```powershell
kape.exe --mdest .\PostMortem --mflush --module CCMRUAFinder_RecentlyUsedApps,Chainsaw,hayabusa_OfflineEventLogs,DHParser,ObsidianForensics_Hindsight,SRUMDump,NirSoft_BrowsingHistoryView,NirSoft_FullEventLogView_PowerShell-Operational,NirSoft_FullEventLogView_ScheduledTasks,NirSoft_FullEventLogView_Security,NirSoft_FullEventLogView_System,!EZParser,LogParser,LogParser_RDPUsageEvents_Custom,RegRipper,PowerShell_Move-KAPEConsoleHost_history,PowerShell_Get-DoSvc4n6,EvtxHussar,NirSoft_TurnedOnTimesView,OneDriveExplorer,PowerShell_SrumECmd_SRUM-RepairAndParse,JLECmd,LECmd,MFTECmd_$MFT,PECmd,RBCmd,RECmd_Kroll,SBECmd --tsource F:\ --tdest .\Targets --tflush --target Notepad++,!SANS_Triage,WinDefendDetectionHist,CombinedLogs,BITS,CloudStorage_All --zip Kape_TriageAcquisition --zv false --gui
```

THor Scanner:

```powershell
kape.exe --msource F:\ --mdest .\Thor --mflush --module Thor-Lite_LiveResponse_Lookback30days --gui  
```

Density Scout:

```powershell
kape.exe --msource F:\ --mdest .\DensityScout --mflush --module DensityScout --gui 
```
