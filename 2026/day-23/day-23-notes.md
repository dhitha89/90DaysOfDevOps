1. What is a branch in Git?
   Branch is copy of the repo where development happens but without effecting main repo before merge.

2. Why do we use branches instead of committing everything to `main`?
   Committing everything to main could introduce bugs or incomplete code when not tested completely.
   It could disturb the flow of work with different commits when many developers are working on same project.

3. What is `HEAD` in Git?
   HEAD is a pointer to your current location in Git. 

4. What happens to your files when you switch branches?
   Git changes the working folder to match that branch by removing files that is not in that branch, adds files which exists only in that branch.

5. What is the difference between `origin` and `upstream`?
   Origin = your own copy on GitHub
   Upstream = the original repo you copied from or forked from

6. What is the difference between `git fetch` and `git pull`?
   git fetch - downloads new changes from remote but does NOT change your files.
   git pull - Downloads changes AND updates/merges your files immediately.

7. What is the difference between clone and fork?
   Clone: Makes a local copy of a repo on your machine and can be used to make changes and be pushed when you have access.
   Fork: Makes a copy on your own GitHub account and used to contribute without write access.

8. When would you clone vs fork?**
   **Use when:**
   - You have access to the repo
   - You're part of the team
   - You want to work on the project directly
   **Use when:**
   - You want to contribute to someone else's project
   - You don't have write access
   - Open source contributions

9. After forking, how do you keep your fork in sync with the original repo?
   After forking we can either sync by clicking sync fork on the Github Repo via UI or via command line interface using below commands
   - `git pull upstream main` or with two line commands ( `git fetch upstream` --> `git merge upstream/main`)
   - `git push origin main`

