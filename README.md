# UITextField-Shake-Swift
UITextField extension in Swift that adds shake animation

Initially created by Andrea Mazzini (using Objective-C) on 08/02/14: https://github.com/andreamazz/UITextField-Shake
and then translated by myself from Objective-C to Swift.

##How to import the framework

- Copy paste the framework to your project.

- Then click on your app's target and drag and drop the framework on General > Embedded Binaries tab.

- Finally import ```UITextFieldShakeSwift.h``` in your controller's header file, or ```UITextFieldShakeSwift``` if you are using the `use_frameworks!` directive.

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
