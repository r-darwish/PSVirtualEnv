@echo off
@setlocal enabledelayedexpansion
@setlocal enableextensions

REM ============================================================================
REM PSVirtualEnv.Tests.bat -----------------------------------------------------
REM ============================================================================

call powershell -nologo -noprofile -file "%~dp0PSVirtualEnv.Tests.Prep.ps1"
