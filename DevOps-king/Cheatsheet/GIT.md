__Git User configuration__

    git config --global user.name "Your Name"
    git config --global user.email "email@example.com"
    git config --global user.password "password"

__Changing Text editor in git__

    git config --global core.editor 'subl -n -w'

__verifing configuration properties__
    
    git config --list

__Creating branch__
    
    git branch newbranch

__Switching to new branch__

    git checkout newbranch

__Merging with master__

    git checkout master
    git merge newbranch

__Moving from stagging area to working area__
    
    git reset HEAD filename

__Revert last commit__

    git reset HEAD~

__Comparing working dir last commit__
    
    git diff HEAD [optional filename]

__Comparing staging are with last commit__
    
    git diff --staged HEAD

__Comparing git commit__

    git logs to get the commit history
    git diff commitid1 commitid2

__Git URL with user/pass__
    
    git clone https://user:password@gitlab.orderhive.plus/devops/dua-me-yad-rakhna.git

__Git add new remote__

    git remote add upstream <remote-url>

__Git remote set-url__

    git remote set-url origin <remote-url>