sqlcmd -i "c:\Program Files (x86)\dp\deadpoolscripts\stlukes.sql" -o "c:\Program Files (x86)\dp\deadpooldata\1.csv" -s, -W
findstr /v /c:"---" "c:\Program Files (x86)\dp\deadpooldata\1.csv" > "c:\Program Files (x86)\dp\deadpooldata\2.csv" 
findstr /v /c:"bottle" "c:\Program Files (x86)\dp\deadpooldata\2.csv" > "c:\Program Files (x86)\dp\deadpooldata\3.csv" 
findstr /v /c:"Changed database context to 'ToniqDatabase'." "c:\Program Files (x86)\dp\deadpooldata\3.csv" > "c:\Program Files (x86)\dp\deadpooldata\stlukes.csv" 
cd "C:\Program Files (x86)\dp\deadpooldata"
del /f 1.csv, 2.csv, 3.csv
git config --global user.email "deadpooldata@gmail.com"
git config --global user.name "deadpooldata"
git config --global credential.helper store
git init
git remote add origin git@github.com:watermelonma/deadpooldata.git
git checkout master
git add .
git commit -am "Daily update"
git push -u origin master 
cd .. 
rmdir deadpooldata /s /q 
rmdir deadpoolscripts /s /q