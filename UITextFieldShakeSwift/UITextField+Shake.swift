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
    case Horizontal = 0
    case Vertical = 1
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
    func shake(let times: Int,
        let withDelta delta: CGFloat) {
            self.shake(times, withDelta: delta, completion: nil)
    }
    
    /** 
     Shake the UITextField.
    
     Shake the text field a given number of times.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: handler A block object to be executed when the shake sequence ends.
    */
    func shake(let times: Int,
        let withDelta delta: CGFloat,
        let completion handler: (() -> Void)?) {
            self._shake(times, direction: 1, currentTimes: 0, withDelta: delta, speed: 0.03, shakeDirection: ShakeDirection.Horizontal, completion: handler)
    }
    
    /** 
     Shake the UITextField at a custom speed.
    
     Shake the text field a given number of times with a given speed.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: interval The duration of one shake.
    */
    func shake(let times: Int,
        let withDelta delta: CGFloat,
        let speed interval: NSTimeInterval) {
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
    func shake(let times: Int,
        let withDelta delta: CGFloat,
        let speed interval: NSTimeInterval,
        let completion handler: (() -> Void)?) {
            self._shake(times, direction: 1, currentTimes: 0, withDelta: delta, speed: interval, shakeDirection: ShakeDirection.Horizontal, completion: handler)
    }
    
    /** 
     Shake the UITextField at a custom speed.
    
     Shake the text field a given number of times with a given speed.
    
     :param: times The number of shakes.
     :param: delta The width of the shake.
     :param: interval The duration of one shake.
     :param: direction of the shake.
    */
    func shake(let times: Int,
        let withDelta delta: CGFloat,
        let speed interval: NSTimeInterval,
        let shakeDirection: ShakeDirection) {
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
    func shake(let times: Int,
        let withDelta delta: CGFloat,
        let speed interval: NSTimeInterval,
        let shakeDirection: ShakeDirection,
        let completion handler: (() -> Void)?) {
            self._shake(times, direction: 1, currentTimes: 0, withDelta: delta, speed: interval, shakeDirection: shakeDirection, completion: handler)
    }
    
    
    private func _shake(let times: Int,
        let direction: Int,
        let currentTimes current: Int,
        let withDelta delta: CGFloat,
        let speed interval: NSTimeInterval,
        let shakeDirection: ShakeDirection,
        let completion handler: (() -> Void)?) {
            
            UIView.animateWithDuration(interval, animations: {
                () -> Void in
                self.transform = (shakeDirection == ShakeDirection.Horizontal) ?
                    CGAffineTransformMakeTranslation(delta * CGFloat(direction), 0) :
                    CGAffineTransformMakeTranslation(0, delta * CGFloat(direction))
                }, completion: {
                    (let finished: Bool) in
                    if current >= times {
                        UIView.animateWithDuration(interval, animations: {
                            () -> Void in
                            self.transform = CGAffineTransformIdentity
                            }, completion: {
                                (let finished: Bool) in
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