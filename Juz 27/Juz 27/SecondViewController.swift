//
//  SecondViewController.swift
//  Juz 27
//
//  Created by Muhammad Hilmy Fauzi on 23/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func play(_ sender: Any)
    {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
        
    }
    @IBAction func prev(_ sender: Any) {
        if thisSurah != 0 && audioStuffed == true
        {
            playThis(thisOne: surahs[thisSurah-1])
            thisSurah -= 1
            label.text = surahs[thisSurah]
        }else{
            
        }
    }
    @IBAction func next(_ sender: Any) {
        if thisSurah < surahs.count-1 && audioStuffed == true
        {
            playThis(thisOne: surahs[thisSurah+1])
            thisSurah += 1
            label.text = surahs[thisSurah]

        }else{
            
        }
    }
    @IBAction func slider(_ sender: UISlider) {
        if audioStuffed == true{
            audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne:String)
    {
        do{
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("ERROR")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = surahs[thisSurah]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

