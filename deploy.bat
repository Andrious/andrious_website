::@ECHO OFF

IF "%1"=="" GOTO exit

cd build/web
git add .
git commit -m "%1"
git push -u origin master
cd ../..

:exit