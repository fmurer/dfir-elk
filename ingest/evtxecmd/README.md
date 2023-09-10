# README

This folder expects Windows eventlogs parsed with the `EvtxECmd` parser from [Eric Zimmerman](https://ericzimmerman.github.io/#!index.md). 

```PowerShell
.\EvtxECmd.exe --sync
.\EvtxECmd.exe -d <EVTX-Folder> --csv <LOG_FOLDER>
```