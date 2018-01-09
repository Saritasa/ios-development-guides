## Distribution of iOS apps 101

> There are some misunderstandings related to distirbution of iOS apps, I'm trying to clarify signing process in this short article.

By default each xcode project has two configurations `Debug` and `Release`, they have differences and you can create more configurations based on this two. `Debug` builds are only appropriate for debugging, i.e. run on a device from Xcode, they require development provisioning profiles. `Release` builds are for installing an app on a device, they should have either Ad Hoc, Enterprise or App Store provisioning profiles. With App Store profiles it's simple they are for submition to Test Flight/App Store. Ad Hoc and Enterprise prifiles have differences: when creating Ad Hoc provisioning profile you should select devices that allow to install an app provisioned with this provisioning profile; Enterprise profiles are only available in enterprise accounts and allow to install an app on any device. Our company has an enterpise account to distribute builds to our test devices.

Combination of App ID, Provisioning profile, entitlments and certificates is used to sign the app. To prepare a project for building on our Jenkins server we need:
- a distribution certificate
- an App ID (tied to a team)
- a provisioning Profile (tied to distribution certificate and an App ID). Additionally if an app requires push notifications an App ID should be configured with Apple Push Notification service SSL Certificates: Development SSL Certificate for `Debug` builds and Production SSL Certificate for `Release` builds. Note: after enabling/disabling push notifications you should regenerate a provisioning profile.

More informaiton about signing can be found in Apple documentation: [Maintaining Your Signing Identities and Certificates](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html)

