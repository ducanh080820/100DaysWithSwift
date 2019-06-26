//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var dataImage = ["1", "4", "5"]
    let WIDTH_SCREEN = UIScreen.main.bounds.width
    let numberOfItems: CGFloat = 3
    let padding: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.myImage.image = UIImage(named: dataImage[indexPath.row])
        
        return cell
        
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //    kích thước của item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = WIDTH_SCREEN/numberOfItems
        return CGSize(width: itemSize, height: itemSize)
    }
    
    //    khoảng cách giữa mỗi cạnh của section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    //    khoảng cách giữa các dòng section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    //    khoảng cách giữa các cột section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
}
}
