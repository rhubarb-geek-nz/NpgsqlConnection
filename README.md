# NpgsqlConnection

Very simple `PowerShell` module for creating a connection to a `PostgreSQL` database.

Build using the `package.ps1` script to create the `NpgsqlConnection.zip` file.

Install by unzipping into a directory on the [PSModulePath](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_psmodulepath)

Create a test database.

```
$ docker volume create postgres-data
$ docker run -d -v postgres-data:/var/lib/postgresql/data -p 5432:5432/tcp -e POSTGRES_PASSWORD=postgres --name postgres-container postgres
```

Run the `test.ps1` to confirm it works.

```

version
-------
PostgreSQL 15.2 (Debian 15.2-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit

```
