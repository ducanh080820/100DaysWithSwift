//
//  ViewController.swift
//  FaceDetect
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myOriginImageView: UIImageView!
    @IBOutlet weak var myResultImageView: UIImageView!
    @IBOutlet weak var myResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myOriginImageView.image = UIImage(named: "face")

    }

    @IBAction func clickToFaceDetect(_ sender: UIButton) {
        let context = CIContext(options: nil)
        let originImage = self.myOriginImageView.image
        let image = CIImage(cgImage: (originImage?.cgImage)!)
        
        
        // Mark: Set identifier parameter
        let param = [CIDetectorAccuracyHigh: CIDetectorAccuracy]
        
        // Đánh dấu: Khai báo CIDetector, đặt loại nhận dạng
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: param)
        
        // Đánh dấu: Nhận kết quả công nhận
        let detectResult = faceDetector?.features(in: image)
        let resultView = UIView(frame: self.myOriginImageView.frame)
        self.view.addSubview(resultView)
        
        for item in detectResult! {
            
            let faceFeature = item as! CIFaceFeature
            let faceView = UIView(frame: faceFeature.bounds)
            faceView.layer.borderWidth = 1
            faceView.layer.borderColor = UIColor.orange.cgColor
            resultView.addSubview(faceView)
            
            // Đánh dấu: mắt trái
            if faceFeature.hasLeftEyePosition {
                
                let leftEyeView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
                leftEyeView.center = faceFeature.leftEyePosition
                leftEyeView.layer.borderColor = UIColor.red.cgColor
                leftEyeView.layer.borderWidth = 1
                resultView.addSubview(leftEyeView)
            }
            
            // Đánh dấu: mắt phải
            if faceFeature.hasRightEyePosition {
                
                let rightEyeView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
                rightEyeView.center = faceFeature.rightEyePosition
                rightEyeView.layer.borderColor = UIColor.red.cgColor
                rightEyeView.layer.borderWidth = 1
                resultView.addSubview(rightEyeView)
            }
            
            // Đánh dấu: miệng
            if faceFeature.hasMouthPosition {
                
                let mouthView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
                mouthView.center = faceFeature.mouthPosition
                mouthView.layer.borderColor = UIColor.red.cgColor
                mouthView.layer.borderWidth = 1
                resultView.addSubview(mouthView)
            }
        }
        
        // Đánh dấu: Chuyển đổi tọa độ
        resultView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        if (detectResult?.count)! > 0 {
            
            let faceImage = image.cropped(to: (detectResult?[0].bounds)!)
            let face = UIImage(cgImage: context.createCGImage(faceImage, from: faceImage.extent)!)
            
            self.myResultImageView.image = face
            
            let resultText = String(format: "Determine the number of faces %i", (detectResult?.count)!)
            
            myResultLabel.text = resultText
        }
    }

}

