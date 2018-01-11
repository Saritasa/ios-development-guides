## Distribution of iOS apps 101

> There are some misunderstandings related to distribution of iOS apps, I'm trying to clarify signing process in this short article.

By default each Xcode project has two configurations `Debug` and `Release`, they have differences and you can create more configurations based on this two. `Debug` builds are only appropriate for debugging, i.e. run on a device from Xcode, they require development provisioning profiles. `Release` builds are for installing an app on a device, they should have either Ad Hoc, Enterprise or App Store provisioning profiles. With App Store profiles it's simple they are for submission to Test Flight/App Store. Ad Hoc and Enterprise profiles have differences: when creating Ad Hoc provisioning profile you should select devices that allow to install an app provisioned with this provisioning profile; Enterprise profiles are only available in enterprise accounts and allow to install an app on any device. Our company has an enterprise account to distribute builds to our test devices.

Combination of App ID, Provisioning profile, entitlements and certificates is used to sign the app. To prepare a project for building on our Jenkins server we need:
- a distribution certificate
- an App ID (tied to a team)
- a provisioning Profile (tied to distribution certificate and an App ID). Additionally if an app requires push notifications an App ID should be configured with Apple Push Notification service SSL Certificates: Development SSL Certificate for `Debug` builds and Production SSL Certificate for `Release` builds. Note: after enabling/disabling push notifications you should regenerate a provisioning profile.

More information about signing can be found in Apple documentation: [Maintaining Your Signing Identities and Certificates](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html)

### FAQ

#### What is the difference between Bundle ID and App ID?

A Bundle ID precisely identifies a single app, example: `com.example.awesomeapp`.

An App ID is a two-part string and consists of a Team ID and a bundle ID search string, with a period (.) separating the two parts, example: `A1B2C3D4E5.com.example.awesomeapp`. You can read more about [App ID](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html).
