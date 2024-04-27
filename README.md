# NpgsqlConnection

Very simple `PowerShell` module for creating a connection to a `PostgreSQL` database.

Build using

```
$ dotnet publish NpgsqlConnection.csproj --configuration Release --property TargetFramework=net6.0
```

Install by copying the publish into a directory on the [PSModulePath](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_psmodulepath)

Create a test database.

```
$ docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres
```

Run the `test.ps1` to confirm it works.

```
version
-------
PostgreSQL 16.2 (Debian 16.2-1.pgdg120+2) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
```
