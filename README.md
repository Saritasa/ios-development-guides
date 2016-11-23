# iOS Development at Saritasa

## API Design Guidelines

Let's use the apple's official api design guidelines https://swift.org/documentation/api-design-guidelines/

## Swift Style Guidelines

- enable "Automatically trim trailing whitespace" (Text Editing > Editing > While edititng)
- 4 spaces, not tabs (Text Editing > Indentation)
- use `swiftlint` https://github.com/realm/SwiftLint

## Best Practices

Let's use swift community best practices https://github.com/schwa/Swift-Community-Best-Practices

## Project Folder Structure

```
.
└── Application
    └── (xcodeproj, xcworkspace and other project files)
└── Artifacts
    └── (certificates and other files)
    └── Provisioning
        └── (Provisioning profiles)
└── README.md
```

## Xcode Project Environment Configuration

Don't use targets to configure environment of an application, use configurations and schemes instead. By default any project already contains `Debug` and `Release` configurations. Create additional configurations, for example: `Debug.Prod`, `Release.Prod`, `AppStore.Prod`. Add additional schemes: `Prod`, `AppStore` and setup correct configurations for `Build`, `Run`, `Test`, `Profile`, `Analyze`, `Archive`. Then you can add user-defined settings (Build Settings > Add User-Defined Setting) and use them in info.plist file (`$(APP_ENV)`)

## Xcode Project Structure

Separate project by modules, for example `Login`, `Settings`, etc. For each module create a folder in a file system and add it to the xcode project, that way when you add files in this category using xcode the files by default will go in correct folder in a file system. Place all xib and sotryboards files and classes related to a module together.

## Autolayout

Use autolayout for relatively static content. If content is very dynamic consider to manually caluclate sizes and frames of views (`UIView.layoutSubviews` and `UIViewController.viewDidLayoutSubviews` is the best place for this)

Prefer to not place all views in one big view or view controller, separate them by functionality for future reusability.
