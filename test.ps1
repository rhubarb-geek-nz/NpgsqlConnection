#!/usr/bin/env pwsh
#
#  Copyright 2023, Roger Brown
#
#  This file is part of rhubarb-geek-nz/NpgsqlConnection.
#
#  This program is free software: you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by the
#  Free Software Foundation, either version 3 of the License, or (at your
#  option) any later version.
# 
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>
#

param(
	$ConnectionString = "Server=localhost;Port=5432;Userid=postgres;Password=postgres",
	$CommandText = "SELECT VERSION()"
)

$ErrorActionPreference = "Stop"

trap
{
	throw $PSItem
}

Write-Host $Env:PSModulePath

$Connection = New-NpgsqlConnection -ConnectionString $ConnectionString

try
{
	$Connection.Open()

	$Command = $Connection.CreateCommand()

	$Command.CommandText = $CommandText

	$Reader = $Command.ExecuteReader()

	try
	{
		while ($Reader.Read())
		{
			Write-Host $Reader.GetString(0)
		}
	}
	finally
	{
		$Reader.Dispose()
	}
}
finally
{
	$Connection.Dispose()
}
