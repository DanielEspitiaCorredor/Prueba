@echo off

if not exist Config.dat goto exit_no_config_file

for /f "tokens=*" %%l in (Config.dat) do (
if /i "%%l"=="offline=1" goto exit_reg_offline_set
)

for /f "tokens=*" %%l in (Config.dat) do (
(echo %%l) >> "Config2.dat"
if /i "%%l"=="[register]" (
echo setting offline registration...
(echo offline=1) >> "Config2.dat"
echo done!
)
)

echo backup Config.dat to Config.bak...
ren Config.dat Config.bak
echo done!

ren Config2.dat Config.dat

echo configuration update completed successfully!

goto :eof

:exit_no_config_file
echo can't find Config.dat!
goto :eof

:exit_reg_offline_set
echo offline registration already set!
goto :eof
