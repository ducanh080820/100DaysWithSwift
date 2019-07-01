//
//  ViewController.swift
//  FilterGaussianBlur
//
//  Created by DSCO on 7/1/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var image: UIImage = UIImage(named: "face")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.image
        label.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeValue(_ sender: AnyObject) {
        let slider = sender as! UISlider
        let value: Float = slider.value
                self.filterGaussianBlur(value)
    }
    
    //MARK: Gaussian blur filter effect
    func filterGaussianBlur(_ value: Float) {
        
        let context = CIContext(options: nil)
        let cImage = CIImage(cgImage: self.image.cgImage!)
        
        let guassianBlur = CIFilter(name: "CIGaussianBlur")
        guassianBlur?.setValue(cImage, forKey: "inputImage")
        
        let text = String(format: "Gaussian Blur Radius : % .2f", value * 10)
        self.label.text = text
        
        guassianBlur!.setValue(value, forKey: "inputRadius")
        let result = guassianBlur?.value(forKey: "outputImage") as! CIImage
        let imageRef = context.createCGImage(result, from: CGRect(x: self.imageView.frame.origin.x, y: self.imageView.frame.origin.y, width: self.imageView.image!.size.width, height: self.imageView.image!.size.height))
        
        let image = UIImage(cgImage: imageRef!)
        self.imageView.image = image
        
    }
    
    func blurImage(usingImage image: UIImage, blurAmount: Float) -> UIImage? {
        guard let ciImage = CIImage(image: image) else {
            return nil
        }
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        let text = String(format: "Gaussian Blur Radius : % .2f", blurAmount*10)
        self.label.text = text
        guard let outputImage = blurFilter?.outputImage else {
            return nil
        }
        return UIImage(ciImage: outputImage)
    }
    
}
