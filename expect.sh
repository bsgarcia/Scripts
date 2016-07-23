#!/usr/bin/expect

# Can be used to launch some shell commmands automatically... 
# "expect" commands may be associated with bash like :

echo start
spawn irssi
expect "connection"
send "/nick random\r"
interact 
echo done

# However, I saw people complaining about the execution speed. Actually,
# I noticed that using expect alone makes the execution WAY quicker than using it with bash. 
# Indeed in the first case the delay between each request is 
# by far shorter.

#                     ///THE REAL CODE STARTS BELOW /// 

# Spawn a shell and run an initial command (here we launch an ssh session)
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no test@test.fr 

# Use correct prompt
set prompt "[:/$ / etc...]"

# Interact with the program launched above 

interact -o -nobuffer -re $prompt return
send "yourpassword\r"
interact -o -nobuffer -re $prompt return
send "cd basile\r"
interact -o -nobuffer -re $prompt return
send "echo done\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
