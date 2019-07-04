//
//  ViewController.swift
//  MusicIndicator
//
//  Created by DSCO on 7/4/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data = [
        Song(name: "Immortals", artist: "Fall Out Boy"),
        Song(name: "What Make You Beautiful", artist: "One Direction"),
        Song(name: "Counting Stars", artist: "Coldplay"),
        Song(name: "Sugar", artist: "Maroon 5"),
        Song(name: "Apologize", artist: "OneRepublic"),
        Song(name: "Hall of Fame", artist: "The Script"),
        Song(name: "Numb", artist: "Linkin Park"),
        Song(name: "Let Her Go", artist: "Passenger"),
        Song(name: "Demons", artist: "Imagine Dragons"),
        Song(name: "Some Nights", artist: "Fun."),
        Song(name: "21 Guns", artist: "Green Day"),
        Song(name: "Mirrors", artist: "Justin Timberlake"),
        Song(name: "Here With You", artist: "Asher Book"),
        Song(name: "Freedom", artist: "Akon"),
        Song(name: "Here I Am", artist: "Bryan Adams"),
        Song(name: "Fool's Day", artist: "Blur")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongCell
        
        cell.namaeLabel.text = data[indexPath.row].name
        cell.artistLabel.text = data[indexPath.row].artist
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 70.0
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor.red
        startMusicIndicatorAnimation(view, xPosition: 370.0, yPosition: 50.0)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/10
    }
    
    func startMusicIndicatorAnimation(_ indicatorView: UIView, xPosition: CGFloat, yPosition: CGFloat) {
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 30.0)
        replicatorLayer.position = CGPoint(x: xPosition, y: yPosition)
        replicatorLayer.backgroundColor = UIColor.clear.cgColor
        indicatorView.layer.addSublayer(replicatorLayer)
        
        let bar = CALayer()
        bar.bounds = CGRect(x: 0.0, y: 0.0, width: 3.0, height: 20.0)
        bar.position = CGPoint(x: 0.0, y: 5.0)
        bar.cornerRadius = 1.0
        bar.backgroundColor = UIColor.white.cgColor
        
        replicatorLayer.addSublayer(bar)
        
        let move = CABasicAnimation(keyPath: "position.y")
        move.toValue = bar.position.y + 10.0
        move.duration = 0.5
        move.autoreverses = true
        move.repeatCount = Float.infinity
        
        bar.add(move, forKey: nil)
        
        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(5.0, 0.0, 0.0)
        replicatorLayer.instanceDelay = 0.33
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}


