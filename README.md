# Google Authenticator Export Swift Parser

Get all the data from the Google Authenticator export data link `otpauth-migration://offline?data=` in one line in Swift.

<img align="left" src="https://github.com/svyatoynick/GAuthSwiftParser/blob/main/Assets/preview.png"/></div>



## Navigate

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
- [Usage](#usage)
- [License](#license)
    - [Acknowledgements](#acknowledgements)

## Installation

### Swift Package Manager
You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:

```swift
dependencies: [
    .package(url: "https://github.com/svyatoynick/GAuthSwiftParser.git", .upToNextMinor(from: "1.0.0"))
]
```

### CocoaPods
To install through [CocoaPods](http://cocoapods.org), simply add the following line to your Podfile:

```ruby
pod 'GAuthSwiftParser'
```
Then run `pod install` in the project directory to install.

## Usage

Before you start, you need to get the link from the QR code to export Google Authenticator data in format: `otpauth-migration://offline?data=YourData` 

After that we get the data from this link through the `getAccounts(code: String)` function:

```swift
// This is an example code, replace it with your own
let code = "otpauth-migration://offline?data=CiAKCkhlbGxvQp6tvu8SBEFsZXgaBkFtYXpvbiABKAEwAgogCgocIRIITUedUv2HEgRNYXJ5GgZHb29nbGUgASgBMAIKHwoKGekSCE1H3VL9hxIFRGFyeWEaBExvdmUgASgBMAIQARgBIAA%3D"
        
let data = GAuthSwiftParser.getAccounts(code: code)
```

After that you can work with `data`, an array of the class `AccountModel` that contains 3 parameters: `name`, `issuer` and`secret`.

## License 
GAuthSwiftParser is available under the MIT license. See the LICENSE file for more info.

### Acknowledgements
GAuthSwiftParser depends on the following open-source projects:

* [SwiftProtobuf](https://github.com/apple/swift-protobuf) by Apple ([License](https://github.com/apple/swift-protobuf/blob/main/LICENSE.txt))
* [SwiftOTP](https://github.com/lachlanbell/SwiftOTP) by Lachlan Bell ([License](https://github.com/lachlanbell/SwiftOTP/blob/master/LICENSE))

