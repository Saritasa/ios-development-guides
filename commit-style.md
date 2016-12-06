
# Work with Git

We are adapting git flow on all our projects. SourceTree supports it out of the box but you can use it in your terminal too. Two main branches are `develop` and `master`, create additional, for example `stage` if you have needs. `develop` is for development, `master` is for tagged releases (AppStore/TestFlight or internal releases).

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
> Note: Some projects that work with Jira require `Task: #{task id}` to be the __last line__ of the commit message.


## Commit Style

1. Please, try to keep about 50 letters in the subject
2. Use Imperative mood for verbs (i.e. Add, Fix, Change, Refactor, Revert etc)
3. Use short but descriptive message
4. Add task number to end of the message, it will be more easy for understanding commit message and easy for searching by task id. And yes, please add task number to each comment!
5. Capitalize the subject line
6. Do not end the subject line with a period
7. Use the body for explain what and why vs. how.
8. If you have made a mistake in your commit message, you can fix it using the command git commit --amend
9. Make often little commits instead of rarely large commits. It's better two commits with messages "Fix bug on login screen" and "Fix crash on the main screen" then one commit with a message "Fix two bugs".

## Useful Git Commands
```bash
# Change (amend) a message of the last commit
git commit --amend -m "A new right comment"
```
