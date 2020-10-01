Rem creates a task with name in /TN flag and path of program to run in /TR flag. Runs as admin on 30s delay from logon
schtasks /create /sc ONLOGON /delay 0000:30 /TN "NameOfTaskGoesHere" /TR "'c:\PathToFileYouWantToOpen'" /RL Highest
