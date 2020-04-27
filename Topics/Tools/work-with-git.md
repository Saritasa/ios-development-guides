# Work with Git

We are adapting git flow on all our projects. SourceTree supports it out of the box but you can use it in your terminal too. Two main branches are `develop` and `master`, create additional, for example `stage` if you have needs. `develop` is for development, `master` is for tagged releases (AppStore/TestFlight or internal releases). Tagged releases should have a tag using format: `{major}.{minor}.{patch}({build number})` that should correspond to `CFBundleShortVersionString` and `CFBundleVersion` values in `info.plist` file respectively.

Please work in `feature/` branches if you anticipate that a feature can take more than one commit. We are using the following naming convention for feature branches:
```
feature/#{task-id}-{short-description}
```
Examples:
```
feature/#A-12-ui-for-module
feature/#89338-add-autograph-library
```

If you work on a fix or a small feature that will take only one commit there is no need to create a separate branch for that. In that case please add an id of the task that you are working on to the commit message, it will be easier to understand and search by task id. Examples:
```
Add user login functionality #65343
Document domain assebmly #TRU-45
```

To merge feature branches please use `No fast-forward` option (`--no-ff` in terminal). It will
always create merge commit which by default will contain branch name. This will help to track
separate commits in the future if needed.

> Note: in different Git GUI clients this option can be called differently, for example in 
SourceTree it's called: `Create a commit event if merge resolved via fast-forward`


## Commit Style Rules

1. Please, try to keep about __50 letters__ in the subject
2. Use Imperative mood for verbs (i.e. Add, Fix, Change, Refactor, Revert etc)
3. Use short but descriptive message
4. Capitalize the subject line
5. Do not end the subject line with a period
6. Use the body to explain what and why vs. how
7. If you have made a mistake in your commit message, you can fix it using the command git commit --amend
8. Make often little commits instead of rarely large commits. It's better two commits with messages "Fix bug on login screen" and "Fix crash on the main screen" then one commit with a message "Fix two bugs".

## Useful Git Commands
```bash
# Change (amend) a message of the last commit
git commit --amend -m "A new right comment"
```
