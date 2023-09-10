# README

This folder expects Azure AD Sign In Logs in a JSON format. The logs are expected to be exported with the collection skript from [Invictus Incident Response](https://github.com/invictus-ir/Microsoft-Extractor-Suite).

```PowerShell
Connect-Azure
Get-ADSignInLogs
```

Before ingesting the logs, they must be normalized. Use the skript to do that.
```Bash
bash scripts/aad_normalize.sh [LOGS] > [LOGS]_normalized.json
```