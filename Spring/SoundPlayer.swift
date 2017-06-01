//
//  JobQuestTests.swift
//  JobQuestTests
//
//  Created by Mohammad Wariszan Che Abdullah Wafa on 04/05/2017.
//  Copyright © 2017 Genaxis Sdn Bhd. All rights reserved.
//

import UIKit
import AudioToolbox

struct SoundPlayer {
    
    static var filename : String?
    static var enabled : Bool = true
    
    private struct Internal {
        static var cache = [URL:SystemSoundID]()
    }
    
    static func playSound(soundFile: String) {
        
        if !enabled {
            return
        }
        
        if let url = Bundle.main.url(forResource: soundFile, withExtension: nil) {
            
            var soundID : SystemSoundID = Internal.cache[url] ?? 0
            
            if soundID == 0 {
                AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
                Internal.cache[url] = soundID
            }
            
            AudioServicesPlaySystemSound(soundID)
            
        } else {
            print("Could not find sound file name `\(soundFile)`")
        }
    }
    
    static func play(file: String) {
        self.playSound(soundFile: file)
    }
}
