//
//  JobQuestTests.swift
//  JobQuestTests
//
//  Created by Mohammad Wariszan Che Abdullah Wafa on 04/05/2017.
//  Copyright © 2017 Genaxis Sdn Bhd. All rights reserved.
//

import UIKit

public class AsyncButton: UIButton {
    
    private var imageURL = [UInt:NSURL]()
    private var placeholderImage = [UInt:UIImage]()
    
    
    public func setImageURL(url: NSURL?, placeholderImage placeholder:UIImage?, forState state:UIControlState) {
        
        imageURL[state.rawValue] = url
        placeholderImage[state.rawValue] = placeholder
        
        if let urlString = url?.absoluteString {
            ImageLoader.sharedLoader.imageForUrl(urlString: urlString) { [weak self] image, url in
                
                if let strongSelf = self {
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        if strongSelf.imageURL[state.rawValue]?.absoluteString == url {
                            strongSelf.setImage(image, for: state)
                        }
                    })
                }
            }
        }
    }
    
}
