### 🎧 StreamingPLATFORM – Music Streaming Database System

📌 Project Overview
StreamingPLATFORM is a relational database project designed to simulate a music streaming service. Built using Microsoft SQL Server and managed via SQL Server Management Studio, the system supports efficient storage, management, and analysis of music streaming data.
This project demonstrates strong skills in database design, T-SQL development, and data modeling, including the implementation of advanced database features such as stored procedures, triggers, and performance optimization techniques.

🎯 Objectives
Design a scalable and normalized relational database
Simulate real-world streaming platform operations
Implement data integrity and automation using SQL features
Enable analytical queries for user behavior and platform performance

🛠️ Technologies Used
Microsoft SQL Server
SQL Server Management Studio
T-SQL (Transact-SQL) for:
Data Definition (DDL)
Data Manipulation (DML)
Stored Procedures
Triggers

The database is structured to reflect a real streaming platform and includes:
Core Entities:
Users – platform users and profiles
Artists / Singers – music creators
Albums – collections of tracks
Tracks – individual songs
Playlists – user-created collections
Playback Logs – listening history and activity

🧩 Data Modeling
📌 Conceptual Model
Defines high-level entities and relationships between them.

📌 Logical Model
Includes:
Primary and foreign keys
Relationships (1:N, N:M)
Normalization structure
📎 Files:
StreamingMusic_ConceptualModel.png
StreamingMusic_LogicModel.png
⚙️ Key Features Implemented

🔹 Stored Procedures
Defined in Stored_Procedures.sql to:
Automate data operations
Improve performance
Encapsulate business logic

🔹 Triggers
Defined in Triggers.sql to:
Enforce data integrity
Automate actions on insert/update/delete

🔹 Temporary Tables
Used in Temporary_Table.sql for:
Intermediate data processing
Query optimization

🔹 In-Memory Tables
Implemented in Singers_InMemoryTable.sql to:
Improve performance for high-speed operations

🔹 Filegroups & Performance
DB_StreamingMusic_filegroup.zip
Data partitioning and storage optimization

🔹 Data Compression & Maintenance
Compression_Type_MusicHistoric.sql
DataFiles_TempDB_DBCC.sql

Used for:
Storage optimization
Database maintenance and consistency checks
🧪 How to Run the Project
✅ 1. Prerequisites
Install:
Microsoft SQL Server
SQL Server Management Studio
✅ 2. Create Database
Open SSMS
Connect to your SQL Server instance
Create a new database:
CREATE DATABASE StreamingPLATFORM;
GO
✅ 3. Execute SQL Scripts
Run the scripts in the following order:
Create_User.sql
Table creation scripts (if included)
Temporary_Table.sql
Singers_InMemoryTable.sql
Stored_Procedures.sql
Triggers.sql
Performance & maintenance scripts
✅ 4. Restore Database (Optional)
If using backup:
Right-click Databases → Restore Database
Select .bak file
Configure settings
Click OK

📊 Example Use Cases
Analyze user listening behavior
Track most popular songs and artists
Generate reports on platform usage
Optimize database performance

💡 Key Learnings
Relational database design and normalization
Advanced T-SQL programming
Query optimization techniques
Real-world data modeling
Performance tuning in SQL Server
🚀 Future Improvements
Integration with Power BI for dashboards
API layer for application integration
Migration to cloud (Azure SQL Database)
Real-time streaming data simulation

 ##### Neide Varela Pascoal
 
Data Analyst
