@echo off
 REM input: 以input變數表示檔名，檔案內每行為IP,編號,註解，且以空白分隔
 REM output:產生Fortigate的IP address與address group執行script，再上傳此script至Fortigate即可
 
 set input=%1
 set member=set member 
 echo config firewall address
 for /f " eol=# tokens=1-3 delims= "  %%i in (%input%) do CALL :oneaddr %%i %%j %%k
 echo end
 
 echo config firewall addrgrp
 echo edit %input%
 echo %member%
 echo end
 goto :EOF
 
 :oneaddr
 echo edit %2  
 echo set subnet %1/32
 set comment=%3  
 if NOT [%3]==[] echo set comment %comment%   
 echo next
 set member=%member% %2
 goto :EOF
 