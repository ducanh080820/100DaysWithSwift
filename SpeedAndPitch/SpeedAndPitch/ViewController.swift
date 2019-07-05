//
//  ViewController.swift
//  SpeedAndPitch
//
//  Created by DSCO on 7/5/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let engine = AVAudioEngine()
    let speedControl = AVAudioUnitVarispeed()
    let pitchControl = AVAudioUnitTimePitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadMusic(_ sender: UIButton) {
        
        
    }
    
    func play(_ url: URL) throws {
        // 1: load the file
        let file = try AVAudioFile(forReading: url)
        
        // 2: create the audio player
        let audioPlayer = AVAudioPlayerNode()
        
        // 3: connect the components to our playback engine
        engine.attach(audioPlayer)
        engine.attach(pitchControl)
        engine.attach(speedControl)
        
        // 4: arrange the parts so that output from one is input to another
        engine.connect(audioPlayer, to: speedControl, format: nil)
        engine.connect(speedControl, to: pitchControl, format: nil)
        engine.connect(pitchControl, to: engine.mainMixerNode, format: nil)
        
        // 5: prepare the player to play its file from the beginning
        audioPlayer.scheduleFile(file, at: nil)
        
        // 6: start the engine and player
        try engine.start()
        audioPlayer.play()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pitchControl.pitch += 50
        speedControl.rate += 0.1
    }

}

