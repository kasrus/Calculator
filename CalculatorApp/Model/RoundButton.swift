//
//  RoundButton.swift
//  CalculatorApp
//
//  Created by Kasumi Ruslim on 10/16/20.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton: CGFloat = 0 {
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
