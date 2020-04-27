
> [Home page](/README.md)

## Firebase

We use firebase to distribute iOS apps to our QA team. Please follow firebase documentation to
integrate their sdk in xcode project.  If a project has multiple environments with different bundle
ids, additionally you need to follow these steps:

1. Create `GoogleService` directory with subdirectories for each bundle id (use bundle id as a name
   of the subdirectory).
2. Download `GoogleService-Info.plist` for each bundle id and place them in corresponded
   subdirectories in `GoogleService` directory.
3. (Optionally) Add `GoogleService` directory in xcode project but do not add
   `GoogleService-Info.plist` files in target.
4. In xcode project, in `Build Phases` add new run script phase and place it right after
   `Dependencies` phase with the following script:
```bash
#!/usr/bin/env bash

if test -z "$PRODUCT_BUNDLE_IDENTIFIER"; then
    echo "error: Bundle ID is not set for some reason"
    exit 1
else
    cp "GoogleService/$PRODUCT_BUNDLE_IDENTIFIER/GoogleService-Info.plist" "GoogleService/GoogleService-Info.plist"
fi
```

It will copy appropriate `GoogleService-Info.plist` and place it in
`GoogleService/GoogleService-Info.plist`.

> Note: as best practice you can put this script in `./scripts/overwrite-google-service-info.sh`.

5. Run or build the project (`Cmd+B`).
6. Add newly created `GoogleService/GoogleService-Info.plist` in project's `.gitignore` (we don't
   want to track any changes to this file in git).
7. Add newly created `GoogleService/GoogleService-Info.plist` file in the target. This file will be
   replaced by an actual file from `GoogleService/<bundle id>/GoogleService-Info.plist`.


## Jenkins

We have a jenkins CI servers. One server for one Xcode version.

Any stage is defined with title:

```groovy
stage('title') {
    // task
}
```

Every build should have default configurations:

Before main tasks:

```groovy
stage('SCM') { // 1. Fetch SCM
    saritasa.git_clone(git_url, git_branch, git_user)
}
stage('keychain') { // 2. Fill keychain
    ios.keychain_show_list()
    ios.keychain_show_identity()
    ios.keychain_unlock(ios.keychain_get_password('keychain-xcode'))
}
```

After main tasks:

```groovy
stage('artifacts') { // 1. Fill artifacts to fetch .ipa file later
    archiveArtifacts artifacts: "*.ipa", fingerprint: true
}
stage('sonarqube') { // 2. Scan with sonarqube rules
    saritasa.sonarqube_scan('swift')
}
```

---

## Fastlane

There is fastlane installed into jenkins. You could use it to define any lane inside your project and run on CI.

To setup fastlane in project use

```bash
fastlane init
# add plugins with
fastlane add_plugin versioning
```

[Fastfile example](/Development/Fastfile)

Lanes:

- [Dev Beta/Staging Beta/Testflight release (with versioning plugin)](/Development/Fastfile)
- [Increment build number from CI number (with versioning plugin)](/Development/Fastfile)
- [Increment build patch number (#.#.x) (with versioning plugin)](/Development/Fastfile)

Can be used in Jenkins CI inside stage:

```groovy
stage('fastlane lane') {
    // Wraps for a proper colorful output
    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm']) {
        # define lane with sh script
        sh(script: 'fastlane ios lane')
    }
}
```

> [Home page](/README.md)
