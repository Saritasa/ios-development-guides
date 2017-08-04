# iOS Development at Saritasa (Draft)

## API Design Guidelines

Let's use the apple's official api design guidelines https://swift.org/documentation/api-design-guidelines/

## Common Code Style Guidelines

Enable "Automatically trim trailing whitespace" (`Text Editing` `>` `Editing` `>` `While edititng`). Ensure that you use 4 spaces, not tabs (`Text Editing` `>` `Indentation`)

### For Swift

Just use `swiftlint` https://github.com/realm/SwiftLint. Take a look at [.swiftlint.yml](.swiftlint.yml) as a basic template for a project.

### For Objective-C

Let's use NYTimes style guide https://github.com/NYTimes/objective-c-style-guide.

Don't forget that literals exist:
- `@123` instead of `[NSNumber numberWithInt:123]`
- `@(someFloatValue)` instead of `[NSNumber numberWithFloat:someFloatValue]`
- `@{key: value}` instead of `[NSDictionary dictionaryWithObjectsAndKeys: value, key, nil]`
- `@[object1, object2, object3]` instead of `[NSArray arrayWithObjects:object1, object2, object3, nil]`

## SonarQube Style Guidelines

Don't forget about SonarQube properties. We should add to exclusions:
`sonar.exclusions=Artifacts/**,Application/ProjectName/Assets.xcassets/**,Application/Pods/**`

## Best Practices

Let's use swift community best practices https://github.com/schwa/Swift-Community-Best-Practices

Also take a look how we [work with git](work-with-git.md)

Don't save commented code in your files. You can use Version Editor in Xcode to see the file's history.

## Geolocation Recommendations

 - Presentation: https://my.visme.co/projects/pv07yg0e-background-location-tracking-ios
 - Don't use geolocation permanently. We should stop updating geolocation after recieving a location.
 - See example in the file `Location Tracking.zip`


## Project Folder Structure

```
.
├── Application
│   └── (xcodeproj, xcworkspace and other project files)
├── Artifacts
│   ├── (certificates and other files)
│   └── Provisioning
│       └── (Provisioning profiles)
└── README.md
```

## Xcode Project Environment Configuration

Don't use targets to configure environment of an application, use configurations and schemes instead. By default any project already contains `Debug` and `Release` configurations. Create additional configurations, for example: `Debug.Prod`, `Release.Prod`, `AppStore.Prod`. Add additional schemes: `Prod`, `AppStore` and setup correct configurations for `Build`, `Run`, `Test`, `Profile`, `Analyze`, `Archive`. Then you can add user-defined settings (Build Settings > Add User-Defined Setting) and use them in info.plist file, for example: `APP_ENV = dev` is user-defined setting you can use it in info.plist as `$(APP_ENV)`.

## Xcode Project Structure

Version of an app should have the following format: `{major}.{minor}.{patch}`, build number is just an integer.

![](build-number.png)

Separate project by modules, for example `Login`, `Settings`, etc. For each module create a folder in a file system and add it to the xcode project, that way when you add files in this category using xcode the files by default will go in correct folder in a file system. Place all xib and sotryboards files and classes related to a module together.

You can place common files/classes that are used by many modules in separate folder/category. It's often the case for models.

## Autolayout

Use autolayout for relatively static content. If content is very dynamic consider to manually caluclate and set sizes and frames of views (`UIView.layoutSubviews` and `UIViewController.viewDidLayoutSubviews` is the best place for this)

Prefer to not place all views in one big view or view controller, separate them by functionality and move them in their own xib for future reusability.

Don't use autolayout to postition views inside a scroll view in a xib or a storyboard. It's very buggy, hard to change and understand. For such cases you should layout views manually or use a stack view or a table view instead.

## Presentations from team talks
- [Reactiveness, Rx, RAC](https://speakerdeck.com/agapovone/reactive-talk)
- [Auto-renewable subscriptions and integration with a backend (+ FP parts)](https://docs.google.com/presentation/d/18lSwwCSm2yEeUY4hRoPGSVCL4C7FjQEia6nQZOXcons/edit?usp=sharing)

## Libraries and Frameworks We Use

- Alamofire for swift projects https://github.com/Alamofire/Alamofire
- AFNetworking for objective-c projects https://github.com/AFNetworking/AFNetworking
- SwiftyJSON https://github.com/SwiftyJSON/SwiftyJSON
- TPKeyboardAvoiding https://github.com/michaeltyson/TPKeyboardAvoiding
- ZipArchive https://github.com/ZipArchive/ZipArchive
- AlecrimCoreData https://github.com/Alecrim/AlecrimCoreData
- MBProgressHUD https://github.com/matej/MBProgressHUD
- SVProgressHUD https://github.com/SVProgressHUD/SVProgressHUD
- SDWebImage https://github.com/rs/SDWebImage
- IFTTTLaunchImage https://github.com/IFTTT/IFTTTLaunchImage
- Spring https://github.com/MengTo/Spring/tree/master/Spring (for nice animations in UI)
- SwiftMessages https://github.com/SwiftKickMobile/SwiftMessages