#!/usr/bin/env pwsh
#
#  Copyright 2023, Roger Brown
#
#  This file is part of rhubarb-geek-nz/NpgsqlConnection.
#
#  This program is free software: you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
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
	$ModuleName = "NpgsqlConnection"
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

trap
{
	throw $PSItem
}

$env:SOURCEDIR="$ModuleName"
$env:NPGSQLVERS=( Import-PowerShellDataFile "$ModuleName/$ModuleName.psd1" ).ModuleVersion

foreach ($List in @(
	@("no","AC83C617-CA46-43F5-A8A1-5480E4AFABBE","netstandard2.0","x86","ProgramFilesFolder","7.0.2"),
	@("yes","218E5AA5-9EFA-4B51-8789-845B81FA77DA","netstandard2.0","x64","ProgramFiles64Folder","7.0.2")
))
{
	$env:NPGSQLISWIN64=$List[0]
	$env:NPGSQLUPGRADECODE=$List[1]
	$env:NPGSQLFRAMEWORK=$List[2]
	$env:NPGSQLPLATFORM=$List[3]
	$env:NPGSQLPROGRAMFILES=$List[4]

	If ( $env:NPGSQLVERS -eq $List[5] )
	{
		$MSINAME = "$ModuleName-$env:NPGSQLVERS-$env:NPGSQLPLATFORM.msi"

		foreach ($Name in "$MSINAME")
		{
			if (Test-Path "$Name")
			{
				Remove-Item "$Name"
			} 
		}

		& "${env:WIX}bin\candle.exe" -nologo "$ModuleName.wxs"

		if ($LastExitCode -ne 0)
		{
			exit $LastExitCode
		}

		& "${env:WIX}bin\light.exe" -nologo -cultures:null -out "$MSINAME" "$ModuleName.wixobj"

		if ($LastExitCode -ne 0)
		{
			exit $LastExitCode
		}
	}
}
