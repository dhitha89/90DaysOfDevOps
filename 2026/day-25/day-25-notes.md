## 1. What is the difference between `--soft`, `--mixed`, and `--hard` reset?
**--soft** —-> undo the commit, keep changes staged
git reset --soft HEAD~1
Before:  A --- B --- C   (HEAD at C)
After:   A --- B         (HEAD at B, C's changes are staged and ready)
C's changes are still there, already staged. Like you never hit commit.

**--mixed** —-> undo the commit, unstage the changes (default)
git reset --mixed HEAD~1 or git reset HEAD~1
Before:  A --- B --- C   (HEAD at C)
After:   A --- B         (HEAD at B, C's changes are in working directory, unstaged)
Changes still there in your files, but you need to git add again to stage them.

**--hard** —-> undo the commit, delete the changes entirely
git reset --hard HEAD~1
Before:  A --- B --- C   (HEAD at C)
After:   A --- B         (HEAD at B, C's changes are GONE)
No changes and last committed version seen


## 2. Which one is destructive and why?
**git reset --hard HEAD~1**  permanently deletes your changes. No undo, no recovery .


## 3. When would you use each one?
**Undo last commit, but keep files staged**
git reset --soft HEAD~1

**Undo last commit, and unstage files**
git reset --mixed HEAD~1

**Delete commit and delete changes**
git reset --hard HEAD~1

## 4. Should you ever use `git reset` on commits that are already pushed?
No, once commits pushed and shared, resetting rewrites public history and breaks everyone else's branch.


## 5. How is `git revert` different from `git reset`?
git reset goes backward, it removes commits from history by moving HEAD back and rewrites history.
git revert goes forward, it undoes a commit by adding a new commit on top and history stays intact.
reset:   A --- B --- C --- D      →     A --- B       (C and D erased)
revert:  A --- B --- C --- D      →     A --- B --- C --- D --- C'  (C undone, nothing erased)

## 6. Why is revert considered **safer** than reset for shared branches?
Reset hard rewrites history that teammates branches break. Revert just adds a new commit and everyone can pull it normally, no force push needed.


## 7. When would you use revert vs reset?
**Revert** used when commit is already pushed and shared, you need to undo it safely without breaking anyone else.
**Reset** used when work is still local, you want to cleanly erase or restructure before pushing.

## 8. Reset vs Revert 
| Task                           | `git reset`                                    | `git revert`                                    |
|--------------------------------|------------------------------------------------|-------------------------------------------------|
| What it does                   | Moves HEAD back to last commit, erases commits | Creates a new commit that undoes a previous one |
| Removes commit from history    | yes                                            | no                                              |
| Safe for shared/pushed branches| no                                             | yes                                             |
| When to use                    | Local cleanup before pushing                   | Undoing something already pushed and shared     |

## 9. Branching Strategies
**GitFlow** -  Multiple long-lived branches:  develop, feature, release, hotfix branches

Diagram
main     ────────●────────●────────
\      /
develop   ──●──●──●──●──●─────────
\    \      \
feature      f1   f2     f3
release                 r1
hotfix           h1

Features branch derived from develop
When ready, release branch cut from develop for testing
Release merges into both main and develop
Hotfixes branch off main and merge back to both 

Used by: large teams, enterprise, scheduled release cycles 
Pros: very structured, clear separation, good for versioned releases
Cons: heavy, slow

**GitHub Flow**
Simple. Just main and short-lived feature branches.
main:    A --- B ----------- M1 ----------- M2
\            /               \
feature:        feat1 ----                   feat2 ---

Branch derived from main, do changes, open MR, review, merge back to main
Main is always deployable

Used by: startups, web apps, teams deploying continuously
Pros: simple, fast, easy to understand
Cons: no structure for staged releases, can get messy with many contributors

**Trunk-Based Development**
Everyone commits directly to main (trunk). Feature branches exist but live only hours or 1-2 days max.
main:   A --- B --- C --- D --- E --- F
\   /       \   /
br1         br2
(hours)      (hours)

No long-lived branches
Heavy use of feature flags 
CI/CD runs on every commit to main

Used by: Google, Facebook, high-velocity teams
Pros: no merge issues, always integrated, fastest flow
Cons: needs discipline, feature flags add complexity, risky without good CI/CD

**which to use when**
Startup shipping fast → GitHub Flow. Simple, no overhead, deploy constantly, iterate quickly.
Large team with scheduled releases → GitFlow. Structured, clear release cycles, multiple versions in flight.

**Open Source Example**
Most open source repos (React, Vue, Linux) use a variant of GitHub Flow — contributors fork, make a feature branch, open a PR against main. 

