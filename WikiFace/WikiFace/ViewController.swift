//
//  ViewController.swift
//  WikiFace
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myImageFace: UIImageView!
    @IBOutlet weak var myTextFieldNameFace: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextFieldNameFace.delegate = self
        self.myImageFace.alpha = 0
        self.myImageFace.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if let textFieldContent = textField.text {
            do {
                try WikiFace.faceForPerson(textFieldContent, size: CGSize(width: 300, height: 400), completion: { (image:UIImage?, imageFound:Bool) -> () in
                    if imageFound == true {
                        DispatchQueue.main.async {
                            self.myImageFace.image = image
                            
                            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { () -> Void in
                                
                                self.myImageFace.transform = CGAffineTransform(scaleX: 1, y: 1)
                                self.myImageFace.alpha = 1
                                
                                //Fuck! Useless...LOL
                                self.myImageFace.layer.shadowOpacity = 0.4
                                self.myImageFace.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
                                self.myImageFace.layer.shadowRadius = 15.0
                                self.myImageFace.layer.shadowColor = UIColor.black.cgColor
                                
                            }, completion: nil )
                            
                            WikiFace.centerImageViewOnFace(self.myImageFace)
                        }
                    }
                    
                })
            }catch WikiFace.WikiFaceError.CouldNotDownloadImage{
                print("Could not access wikipedia for downloading an image")
            } catch {
                print(error)
            }
        }
        
        return true
        
    }

}

