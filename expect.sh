#!/usr/bin/expect
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no test@test.fr 
#use correct prompt
set prompt ":"
interact -o -nobuffer -re $prompt return
send "yourpassword\r"
interact -o -nobuffer -re $prompt return
send "cd basile\r"
interact -o -nobuffer -re $prompt return
send "echo done\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
