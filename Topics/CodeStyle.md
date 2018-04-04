## Code Style
---

> [Home page](/README.md)

### Common Code Style Guidelines

- Enable "Automatically trim trailing whitespace" (`Text Editing` `>` `Editing` `>` `While edititng`). 
- Ensure that you use 2 spaces, not tabs (`Text Editing` `>` `Indentation`)

### Best Practices

Don't save commented code in your files. You can use Version Editor in Xcode to see the file's history.

#### Swift

Use [Apple's official api design guidelines](https://swift.org/documentation/api-design-guidelines/)

[Swift style guide](https://github.com/eure/swift-style-guide) to consider.

Use [Swift community best practices as recommendation ](https://github.com/bencochran/Swift-Community-Best-Practices) (might be outdate)

Use [SwiftLint tool](https://github.com/realm/SwiftLint). Take a look at our latest [.swiftlint.yml](../Development/.swiftlint.yml) as a basic template for a project.

#### Objective-C

Let's use NYTimes style guide https://github.com/NYTimes/objective-c-style-guide.

Don't forget that literals exist:
- `@123` instead of `[NSNumber numberWithInt:123]`
- `@(someFloatValue)` instead of `[NSNumber numberWithFloat:someFloatValue]`
- `@{key: value}` instead of `[NSDictionary dictionaryWithObjectsAndKeys: value, key, nil]`
- `@[object1, object2, object3]` instead of `[NSArray arrayWithObjects:object1, object2, object3, nil]`

#### SonarQube

Don't forget about SonarQube properties. We should add to exclusions:
`sonar.exclusions=Artifacts/**,Application/ProjectName/Assets.xcassets/**,Application/Pods/**`

> [Home page](/README.md)
