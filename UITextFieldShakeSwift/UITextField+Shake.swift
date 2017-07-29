//
//  UITextField+Shake.swift
//  UITextFieldShakeSwift
//
//  UITextFieldShakeSwift version 1.0.3
//
//  Initially created by Andrea Mazzini (using Objective-C) on 08/02/14.
//  Translated from Objective-C to Swift by King-Wizard on 09/05/15.
//  Copyright (c) 2015 King-Wizard. All rights reserved.
//

import UIKit
import Foundation

/** 
 @enum ShakeDirection

 Enum that specifies the direction of the shake
*/
public enum ShakeDirection : Int {
    case horizontal = 0
    case vertical = 1
}

/*
Swift Framework creation: http://bit.ly/1T8SkUR

Build your own Cocoa Touch Frameworks, in pure Swift: http://bit.ly/1gNLyZ8

Deleting contents from Xcode Derived data folder: http://bit.ly/1ItWqSo
*/

public extension UITextField {
    
    /**
     Shake the UITextField.
    
     Shake the text field with default values.
    */
    func shake() {
        self.shake(10, withDelta: 5, completion: nil)
    }
    
    /**
     Shake the UITextField.
    
     Shake the text field a given number of times.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
    */
    func shake(_ times: Int,
        withDelta delta: CGFloat) {
            self.shake(times, withDelta: delta, completion: nil)
    }
    
    /** 
     Shake the UITextField.
    
     Shake the text field a given number of times.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: handler A block object to be executed when the shake sequence ends.
    */
    func shake(_ times: Int,
        withDelta delta: CGFloat,
        completion handler: (() -> Void)?) {
            self._shake(times, direction: 1, currentTimes: 0, withDelta: delta, speed: 0.03, shakeDirection: ShakeDirection.horizontal, completion: handler)
    }
    
    /** 
     Shake the UITextField at a custom speed.
    
     Shake the text field a given number of times with a given speed.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: interval The duration of one shake.
    */
    func shake(_ times: Int,
        withDelta delta: CGFloat,
        speed interval: TimeInterval) {
            self.shake(times, withDelta: delta, speed: interval, completion: nil)
    }
    
    /** 
     Shake the UITextField at a custom speed.
    
     Shake the text field a given number of times with a given speed.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: interval The duration of one shake.
     :param: handler A block object to be executed when the shake sequence ends.
    */
    func shake(_ times: Int,
        withDelta delta: CGFloat,
        speed interval: TimeInterval,
        completion handler: (() -> Void)?) {
            self._shake(times, direction: 1, currentTimes: 0, withDelta: delta, speed: interval, shakeDirection: ShakeDirection.horizontal, completion: handler)
    }
    
    /** 
     Shake the UITextField at a custom speed.
    
     Shake the text field a given number of times with a given speed.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: interval The duration of one shake.
     :param: direction of the shake.
    */
    func shake(_ times: Int,
        withDelta delta: CGFloat,
        speed interval: TimeInterval,
        shakeDirection: ShakeDirection) {
            self.shake(times, withDelta: delta, speed: interval, shakeDirection: shakeDirection, completion: nil)
    }
    
    /** 
     Shake the UITextField at a custom speed.
    
     Shake the text field a given number of times with a given speed.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: interval The duration of one shake.
     :param: direction of the shake.
     :param: handler A block object to be executed when the shake sequence ends.
    */
    func shake(_ times: Int,
        withDelta delta: CGFloat,
        speed interval: TimeInterval,
        shakeDirection: ShakeDirection,
        completion handler: (() -> Void)?) {
            self._shake(times, direction: 1, currentTimes: 0, withDelta: delta, speed: interval, shakeDirection: shakeDirection, completion: handler)
    }
    
    
    private func _shake(_ times: Int,
        direction: Int,
        currentTimes current: Int,
        withDelta delta: CGFloat,
        speed interval: TimeInterval,
        shakeDirection: ShakeDirection,
        completion handler: (() -> Void)?) {
            
            UIView.animate(withDuration: interval, animations: {
                () -> Void in
                self.transform = (shakeDirection == ShakeDirection.horizontal) ?
                    CGAffineTransform(translationX: delta * CGFloat(direction), y: 0) :
                    CGAffineTransform(translationX: 0, y: delta * CGFloat(direction))
                }, completion: {
                    (finished: Bool) in
                    if current >= times {
                        UIView.animate(withDuration: interval, animations: {
                            () -> Void in
                            self.transform = CGAffineTransform.identity
                            }, completion: {
                                (finished: Bool) in
                                if let handler = handler {
                                    handler()
                                }
                        })
                        return
                    }
                    self._shake(times - 1,
                        direction: direction * -1,
                        currentTimes: current + 1,
                        withDelta: delta,
                        speed: interval,
                        shakeDirection: shakeDirection,
                        completion: handler)
            })
    }
    
}
