//
//  JobQuestTests.swift
//  JobQuestTests
//
//  Created by Mohammad Wariszan Che Abdullah Wafa on 04/05/2017.
//  Copyright © 2017 Genaxis Sdn Bhd. All rights reserved.
//

import UIKit

@IBDesignable public class DesignableLabel: SpringLabel {

    @IBInspectable public var lineHeight: CGFloat = 1.5 {
        didSet {
            let font = UIFont(name: self.font.fontName, size: self.font.pointSize)
            let text = self.text
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight
            
            let attributedString = NSMutableAttributedString(string: text!)
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attributedString.length))
            
            self.attributedText = attributedString
        }
    }

}
