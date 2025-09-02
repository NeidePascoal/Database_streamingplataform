# StreamingPLATFORM

## Project Description
The StreamingPLATFORM project is a music streaming platform created in Microsoft SQL Server, managed through SQL Server Management Studio (SSMS). It enables efficient management of user, artist, album, track, and playback statistics data.

## Technologies Used
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL for data creation and manipulation
- Backup file (.bak) for database restoration

## Database Structure
The database includes tables for:
- Users
- Artists
- Albums
- Tracks
- Playlists
- Playback logs

## Restore Database from Backup (.bak)
To restore the database in SSMS:
1. Open SQL Server Management Studio.
2. Connect to your SQL Server instance.
3. Right-click on "Databases" and select "Restore Database".
4. On the "General" tab, choose "Device" and select the `.bak` file.
5. Configure the database name and other restore options.
6. Click "OK" to start the process.

## Usage
After restoring the database, run T-SQL scripts to:
- Insert and update data
- Perform custom queries and reports
- Analyze system usage

## How to Contribute
Contributions are welcome! Please send pull requests for:
- Bug fixes
- New features
- Improvements in database structure or scripts



