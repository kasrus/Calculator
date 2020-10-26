//
//  OvalButton.swift
//  CalculatorApp
//
//  Created by Kasumi Ruslim on 10/17/20.
//

import UIKit

@IBDesignable
class OvalButton: UIButton {
    
        @IBInspectable var ovalButton: CGFloat = 0 {
            didSet {
                customizeView()
            }
        }
        
        
        override func prepareForInterfaceBuilder() {
           customizeView()
        }

    func customizeView () {
        layer.cornerRadius = 40
    
    }
}
