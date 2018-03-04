## Tools we use
---

> [Home page](/README.md)

## Jenkins
We have a jenkins CI servers. One server for one Xcode version.

Any stage is defined with title:
```
stage('title') {
    // task
}
```

Every build should have default configurations:

Before main tasks:
1. Fetch SCM
1. Retrieve keychain values

After main tasks:
1. Artifacts
`archiveArtifacts artifacts: "*.ipa", fingerprint: true`
1. Sonarqube
` saritasa.sonarqube_scan('swift')`


## Fastlane
There is fastlane installed into jenkins. You could use it to define any lane inside your project and run on CI.

Configurations:
- [Increment build number from CI number](/Development/Fastfile)
- [Increment build patch number (#.#.x)](/Development/Fastfile)

Can be used in jenkins inside stage:
```
stage('fastlane lane') {
    // Wraps for a proper colorful output
    wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'XTerm']) {
        # define lane with sh script
        sh(script: 'fastlane ios set_build_number_from_ci')
    }
}
```


> [Home page](/README.md)
