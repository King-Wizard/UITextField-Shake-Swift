//
//  ViewController.swift
//  UITextFieldShakeSwiftDemo
//
//  Initially created by Andrea Mazzini (using Objective-C) on 08/02/14.
//  Translated from Objective-C to Swift by King-Wizard
//  Copyright (c) 2015 Xylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPressed(sender: UIButton) {
//        // Shake
//        self.textField.shake()

//        // Shake with the default speed
//        self.textField.shake(10,              // 10 times
//            withDelta: 5.0   // 5 points wide
//        )
        
//        // Shake with a custom speed
//        self.textField.shake(10,              // 10 times
//            withDelta: 5.0,  // 5 points wide
//            speed: 0.03      // 30ms per shake
//        )
        
//        // Shake with a custom speed and direction
//        self.textField.shake(10,              // 10 times
//            withDelta: 5.0,  // 5 points wide
//            speed: 0.03,     // 30ms per shake
//            shakeDirection: ShakeDirection.Vertical
//        )
        
        self.textField.shake(10, withDelta: 5.0) {
            () -> Void in
            self.calledAfterTextFieldEndedUpShaking()
        }
        
    }
    
    private func calledAfterTextFieldEndedUpShaking() {
        print("The text field has just stopped shaking.")
    }
    
}
