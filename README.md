# UITextField-Shake-Swift [![CI Status](http://img.shields.io/travis/King-Wizard/UITextField-Shake-Swift.svg?style=flat)](https://travis-ci.org/King-Wizard/UITextField-Shake-Swift)
UITextField extension in Swift that adds shake animation

Initially created by Andrea Mazzini (using Objective-C) on 08/02/14: https://github.com/andreamazz/UITextField-Shake

Translated by myself from Objective-C to Swift and provided to you on this repository.

##Setup with CocoaPods (recommended setup)

- Add the instructions below to your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'UITextField-Shake-Swift'
```

- Then add ```import UITextField_Shake_Swift``` at the top of your Swift class.

- Finally compile and run and you will be good to go.


####Otherwise you can also manually import the framework

Just drag and drop ```UITextFieldShakeSwift/UITextFieldShakeSwift/UITextField+Shake.swift``` file into your Xcode project and do not forget to check the checkbox entitled "Copy items if needed" and the appropriate checkboxe(s) in "Add to targets" section.

##Usage

###In Swift

```swift
// Shake
self.textField.shake()
        
// Shake with the default speed
self.textField.shake(10,              // 10 times
                     withDelta: 5.0   // 5 points wide
)
        
// Shake with a custom speed
self.textField.shake(10,              // 10 times
                     withDelta: 5.0,  // 5 points wide
                     speed: 0.03      // 30ms per shake
)
        
// Shake with a custom speed and direction
self.textField.shake(10,              // 10 times
                     withDelta: 5.0,  // 5 points wide
                     speed: 0.03,     // 30ms per shake
                     shakeDirection: ShakeDirection.Vertical
)
```

####Completion Handler
You can also pass a closure that will be run as soon as the shake animation stops:
```swift
// Using the trailing closure syntax
self.textField.shake(10, withDelta: 5.0) {
    () -> Void in
    println("Called after TextField ended up shaking")
}
```
