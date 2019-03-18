set -e 

echo 'github username:'
read username
echo 'Creating repo based on current directory name...'

dir=$(basename $(pwd))
str='{"name":"'"$dir"'", "description":"Research project"}' 
msg=$(curl -u $username https://api.github.com/user/repos -d "$str")
echo '*****************************************************'

#case "error" in
# *"$msg"*) echo 'SOMETHING WENT WRONG'
#esac

echo 'CREATED SUCCESSFULLY'
echo 'Init and push current repo (caution, all files are added)...'

git init
git add .
git commit -a -m "first commit"
git remote add origin https://github.com/$username/$dir.git
git push --set-upstream origin master

echo 'DONE'
