//
//  JobQuestTests.swift
//  JobQuestTests
//
//  Created by Mohammad Wariszan Che Abdullah Wafa on 04/05/2017.
//  Copyright © 2017 Genaxis Sdn Bhd. All rights reserved.
//

import UIKit

public class AutoTextView: UITextView {

    public override var intrinsicContentSize: CGSize {
        get {
            var size = self.sizeThatFits(CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
            size.width = self.frame.size.width
            if text.length == 0 {
                size.height = 0
            }
            
            contentInset = UIEdgeInsets(top: -4, left: -4, bottom: -4, right: -4)
            layoutIfNeeded()
            
            return size
        }
    }
}
