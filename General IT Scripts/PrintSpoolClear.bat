net stop spooler
del /F /Q %systemroot%\System32\spool\PRINTERS\*
net start spooler


