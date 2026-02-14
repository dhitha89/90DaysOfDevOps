# Git Workflow:

**1. What is the difference between `git add` and `git commit`?**
Git add -> used to stage the new files or modified files staging area
Git commit -> saves the staged changes to the repository with a message including a update in Git history

**2. What does the **staging area** do? Why doesn't Git just commit directly?**
Staging area is area before commit. We can choose what files will be committed by sending selected files to staging area.

**3. What information does `git log` show you?**
Git log shows entire commit history with author name, date and commit message.

**4. What is the `.git/` folder and what happens if you delete it?**
- ./git folder contains meta data, history, config info
- If .git/ is deleted the entire git history is lost and repo is like normal folder.

**5. What is the difference between a _working directory_, _staging area_, and _repository_?**
Working Directory - Your current project files that you can see and edit.
Staging Area - Staging area is area before commit that contains the changed files
Repository - It contains every commit, every branch, and every version of every file since the project was initialised.