//
//  ViewController.swift
//  DrawingBoard
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var board: DrawingBoard!
    
    @IBOutlet weak var saveImageButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.backgroundColor = UIColor.white
        saveImageButton.layer.cornerRadius = 5
        clearButton.layer.cornerRadius = 5
    }
    
    @IBAction func changeStrokeColor(_ sender: UIButton) {
        
        // BUG: will change the color of all lines
        board.pathColor = UIColor.red
    }
    
    @IBAction func saveImage(_ sender: UIButton) {
        
        let image = self.board.getImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        let alertController = UIAlertController(title: "Saved success", message: "", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        self.board.clearBoard()
    }
    
    @IBAction func clearDrawBoard(_ sender: UIButton) {
        self.board.clearBoard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



}

