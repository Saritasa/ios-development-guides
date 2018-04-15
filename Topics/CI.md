## Tools we use
---

> [Home page](/README.md)

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
