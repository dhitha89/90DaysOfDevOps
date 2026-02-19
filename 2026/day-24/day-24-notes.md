## 1. What is a fast-forward merge?
When target branch has no new commits since branching.

**Before merge:**
main:    A ── B
feature:       C ── D

**Merge:**
git checkout main
git merge feature

**After merge (fast-forward):**
main:    A ── B ── C ── D
feature:       C ── D

No merge commit; main just moves forward.

## 2. When does Git create a merge commit instead?
When both branches have new commits since branching.

**Before merge:**
main:    A ── B ── E
feature:       C ── D

**Merge:**
git checkout main
git merge feature

**After merge :**
        C ── D
       /      \
A ── B ── E ── M

Git creates merge commit M(merge feature into main a popup opens) to combine histories.

## 3. What is a merge conflict?
When both branches edit the same line in a file.

**File app.txt before branching:**
Hello World

**On main change line to:**
Hello from main

**On feature change line to:**
Hello from feature

**(conflict):**
"Hello from feature"
/
Hello World ── Initial text on main before the branch was created
\
"Hello from main" - Text after branch created and text is updated

**Merge attempt:**
git merge feature

Git shows:
CONFLICT (content): Merge conflict in app.txt

## 4. What does rebase actually do to your commits?
Rebase replays your commits on top of another branch
suppose we create branch feature from main:
**git rebase main** (in case main did a commit after branching then rebase will rewrite the commit history as if feature branch started from latest commit of branch main)


## 5. How is the history different from a merge?

Merge preserves the true branching history and creates a merge commit:
main:   A --- B --- C ------- M   ← merge commit
                     \       /
feature:              D --- E

Rebase rewrites history to look linear — as if it all belonged to one branch
main:   A --- B --- C --- D' --- E'   ← D and E are new commits

## 6. Why should you **never rebase commits that have been pushed and shared** with others?
When you rebase, Git creates brand new commits with different SHAs. If someone else already has your old commits, their history and yours are now incompatible

## 7. When would you use rebase vs merge?
Use rebase when:
- Cleaning up messy local commits before a PR
- Keeping a feature branch up to date with main (locally)merge

Use Merge when:
- Merging a finished branch into main
- Preserving exact history without changing with new hashes or commits
- Work is already pushed and shared to remote


## 8. What does squash merging do?
git merge --squash feature
It takes all commits on your feature branch and combines them into a single commit on main.

## 9. When would you use squash merge vs regular merge?
- git merge feature          # keeps all commits and adds merge commit
- git merge --squash feature # it combines all branch commit into one commit, no merge commit

## 10. What is the trade-off of squashing?
- Advantage: Clean, readable main branch history. 
- Disadvantage: You lose the full history of how the feature was built and commits are gone forever.

## 11. What is the difference between `git stash pop` and `git stash apply`?
- git stash pop     # restores and deletes the stash. Use pop when you just want your work back and don't need the stash anymore.
- git stash apply   # restores but keeps the stash. Use apply when you want to restore the same stash on multiple branches.

## 12. When would you use stash in a real-world workflow?
When your in the middle of something, and want to fix the bug or hotfix — you can't commit half-done work. So you git stash to save it in memory, fix the bug, then git stash pop to get back exactly where you were.

## 13. What does cherry-pick do?
git Cherry-pick
Grab a single specific commit from anywhere and places it onto your current branch.

    main:    A --- B --- C --- D
                          \
    feature:               E --- F --- G

You want only commit F on main:
git checkout main
git cherry-pick F

    main:    A --- B --- C --- D --- F'
                          \
    feature:               E --- F --- G

F is copied (new SHA, same changes) onto main. Feature branch untouched.

## 14. When would you use cherry-pick in a real project?
Hotfix present in a feature branch — the fix is ready but the feature isn't, cherry-pick just the fix commit onto main.
When you fixed a bug on main, now you need that same fix on an older release branch.

## 15. What can go wrong with cherry-picking?
**Duplicate commits** — if cherry-picked commit later merges into main normally, you now have the same change twice with different SHAs. 
**Workflow missing** — a commit often depends on previous commits. Cherry-picking B without A might break things or cause conflicts because the commit A modification doesn't still exist on the target branch.
