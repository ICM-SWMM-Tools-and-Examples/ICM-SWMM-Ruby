@echo off
setlocal enabledelayedexpansion
set i=999
for %%f in (*.xp) do (
  set /a i+=1
  md "!i!_%%~nf"
  md "!i!_%%~nf\SWMM5_RNF
    md "!i!_%%~nf\SWMM5_SAN
      md "!i!_%%~nf\SWMM5_HDR
        md "!i!_%%~nf\XPX_RNF
          md "!i!_%%~nf\XPX_HDR
  copy "%%f" "!i!_%%~nf\"
)
pause

