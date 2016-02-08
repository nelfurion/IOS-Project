//
//  SoundEngine.swift
//  SoA
//
//  Created by John Doe on 2/8/16.
//  Copyright © 2016 John Doe. All rights reserved.
//
/*
import Foundation
import AVFoundation

class SoundEngine : NSObject {
    var player:AVAudioPlayer;
    
    override init() {
        player = AVAudioPlayer()
        super.init()
    }
    
    func play(fileName: String, type: String) {
        let soundFilePath:String = NSBundle.mainBundle().pathForResource(fileName, ofType: type)!;
        let soundData:NSData = NSData(contentsOfFile: soundFilePath)!;
        do {
            try player = AVAudioPlayer(data: soundData);
            player.prepareToPlay();
            player.play();
        }
        catch {
            print("Sound engine could not play file.");
        }
    }
    
    func toggle() {
        if (player.playing) {
            player.stop();
            player.currentTime = 0;
        } else {
            player.prepareToPlay();
            player.play();
        }
    }
}
*/