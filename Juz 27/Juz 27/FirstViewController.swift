//
//  FirstViewController.swift
//  Juz 27
//
//  Created by Muhammad Hilmy Fauzi on 23/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()
var surahs:[String] = []
var thisSurah = 0
var audioStuffed = false

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return surahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = surahs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do{
            let audioPath = Bundle.main.path(forResource: surahs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSurah = indexPath.row
            audioStuffed = true
        }
        catch
        {
            print("ERROR")
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getSurahName()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSurahName()
    {
        let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        do
        {
            let surahPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for surah in surahPath
            {
                var mySurah = surah.absoluteString
                
                if mySurah.contains(".mp3")
                {
                    let findString = mySurah.components(separatedBy: "/")
                    mySurah = findString[findString.count-1]
                    mySurah = mySurah.replacingOccurrences(of: "%20", with: " ")
                    mySurah = mySurah.replacingOccurrences(of: ".mp3", with: "")
                    surahs.append(mySurah)
                }
            }
            
            myTableView.reloadData()
        }
        catch
        {
            print ("ERROR")

        }
    }

}

