# DB/SQL Sessions 1-10

Each `session_XX.sql` file is standalone and runnable in MySQL Workbench or the MySQL command-line client.

## Run in MySQL Workbench

1. Open one `.sql` file.
2. Connect to your local MySQL server.
3. Click the lightning-bolt Execute button.
4. Refresh the Schemas panel and inspect the session database.

Each file uses its own database (`dbsql_session_01` through `dbsql_session_10`), so sessions do not conflict with one another.

## GitHub

```bash
git init
git add .
git commit -m "Add DB SQL session exercises"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/db-sql-sessions.git
git push -u origin main
```

Do not commit real passwords, `.env` files, or database backups.
