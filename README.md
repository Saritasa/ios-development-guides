# iOS Development at Saritasa

### tl;dr
Use Swift, Cocoapods.
Lint with [swiftlint.yml](Development/.swiftlint.yml).
[Libraries are here](Topics/Libraries.md). For network use [Moya](https://github.com/Moya/Moya) + [Alamofire](https://github.com/Alamofire/Alamofire) + [Codable](https://medium.com/@sarunw/codable-in-swift-4-0-1a12e38599d8).

### Topics

1. [Team Talks](Topics/Talks.md)
	1. [Presentations](Topics/Talks.md#presentations)
	1. [Demo](Topics/Talks.md#demos)
1. [Code style](Topics/CodeStyle.md) - all about coding time
	1. [Swift](Topics/CodeStyle.md#swift)
    1. [Objective-C](Topics/CodeStyle.md#objective-c)
	1. [Sonarqube](Topics/CodeStyle.md#sonarqube)
1. [Guidelines](Topics/Guidelines.md) - basic tips
	1. [Project folder structure](Topics/Guidelines.md#project-folder-structure)
	1. [Geolocation](Topics/Guidelines.md#geolocation)
	1. [Env configuration](Topics/Guidelines.md#xcode-project-environment-configuration)
	1. [Build numbers](Topics/Guidelines.md#build-number)
	1. [Autolayout](Topics/Guidelines.md#autolayout)
	1. [Optmizing build times](Topics/Guidelines.md#optimizing-build-times)
	1. [Push Notifications](Topics/Guidelines.md#push-notifications)
1. [Distribution, App Store](Topics/Distribution-101.md)
	1. [Common distribution guide](Topics/Distribution-101.md#distribution-of-ios-apps-101)
	1. [First version to App Store](Topics/Distribution-101.md#first-version-to-app-store)
1. [Tools](Topics/Tools.md)
	1. [Git](Topics/Tools.md#git)
	1. [Cocoapods](Topics/Tools.md#cocoapods)
	1. [Swiftlint](Topics/Tools.md#swiftlint)
	1. [Swiftformat](Topics/Tools.md#swiftformat)
1. [CI & Firebase](Topics/CI.md)
1. [Libraries](Topics/Libraries.md)
1. [Examples](Examples/Examples.md)
	1. [Closures](Examples/Examples.md#examples)
    1. [Coordinators](Examples/Examples.md#examples)
    1. [Data source](Examples/Examples.md#examples)
    1. [Delegates](Examples/Examples.md#examples)

### Solved issues

- `UITableViewCell` and `UICollectionViewCell` reset background color of their views on selection. This behaviour is not always desirable. We've found two solutions. First is override `backgroundColor` of a view and second is override `setSelected` and/or `setHighlighted` methods of a cell and manually set background colors there. See discussion in https://github.com/Saritasa/ios-development-guides/pull/43

> Saritasa iOS Development team
