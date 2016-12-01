
# Commit Style

1. Please, try to keep about 50 letters in the subject
2. Use Imperative mood for verbs (i.e. Add, Fix, Change, Refactor, Revert etc)
3. Use short but descriptive message
4. Add task number to end of the message, it will be more easy for understanding commit message and easy for searching by task id. And yes, please add task number to each comment!
5. Capitalize the subject line
6. Do not end the subject line with a period
7. Use the body for explain what and why vs. how.
8. If you have made a mistake in your commit message, you can fix it using the command git commit --amend
9. Make often little commits instead of rarely large commits. It's better two commits with messages "Fix bug on login screen" and "Fix crash on the main screen" then one commit with a message "Fix two bugs".

### Examples
```
Add user login functionality #65343
Document domain assebmly #TRU-45
git commit --amend -m "A new right comment"
```
