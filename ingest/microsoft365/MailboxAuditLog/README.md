# README

This folder expects Mailbox Audit Logs from Microsoft 365. The logs are expected to be exported with the collection skript from [Invictus Incident Response](https://github.com/invictus-ir/Microsoft-Extractor-Suite).

```PowerShell
Connect-M365
Get-MailboxAuditLog
```