# NpgsqlConnection

Very simple `PowerShell` module for creating a connection to a `PostgreSQL` database.

Build using the `package.ps1` script to create the module.

Install by copying into a directory on the [PSModulePath](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_psmodulepath)

Create a test database.

```
$ docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres
```

Run the `test.ps1` to confirm it works.

```

version
-------
PostgreSQL 15.2 (Debian 15.2-1.pgdg110+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 10.2.1-6) 10.2.1 20210110, 64-bit

```
