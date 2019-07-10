//
//  ViewController.swift
//  Add-Delete-EditDataInCollectionView
//
//  Created by DSCO on 7/10/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var trackButton: UIBarButtonItem!
    @IBOutlet var toolbar: UIToolbar!
    var list = [Int](1...100)
    
    private let numberItemInRow: CGFloat = 4
    private let minimumInteritemSpacing: CGFloat = 1
    private let miniumLineSpacing: CGFloat = 1
    
    private var pilotContraint: NSLayoutConstraint!
    private var toolbarHeight: CGFloat = 80
    
    fileprivate func setupToolbar() {
        view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.leftAnchor.constraint(equalTo:  view.leftAnchor).isActive = true
        toolbar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pilotContraint = toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: toolbarHeight)
        toolbar.heightAnchor.constraint(equalToConstant: toolbarHeight).isActive = true
        pilotContraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = (view.frame.width - (numberItemInRow - 1) * minimumInteritemSpacing) / numberItemInRow
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        flowLayout.minimumLineSpacing  = miniumLineSpacing
        flowLayout.minimumInteritemSpacing = minimumInteritemSpacing
        navigationItem.leftBarButtonItem = editButtonItem
        setupToolbar()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView.allowsMultipleSelection = editing
        addButton.isEnabled = !isEditing
        UIView.animate(withDuration: 0.35) {
            
            self.pilotContraint.constant = editing ? 0 : self.toolbarHeight
            self.view.layoutIfNeeded()
        }
        collectionView.visibleCells.forEach{($0 as? CollectionViewCell)?.isEditting = editing}
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return !isEditing
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.mylabel.text = String(list[indexPath.row])
        cell.isEditting = isEditing
        
        return cell
    }
    
    fileprivate func checkTrashButtonNeedToDisplay() {
        if let selectedItemsIndexPath = collectionView.indexPathsForSelectedItems {
            trackButton.isEnabled = selectedItemsIndexPath.count > 0
        } else {
            trackButton.isEnabled = false
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        checkTrashButtonNeedToDisplay()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        checkTrashButtonNeedToDisplay()
    }
    
    @IBAction func deleteItems(_ sender: UIBarButtonItem) {
        guard let selectedItemsIndexPaths = collectionView.indexPathsForSelectedItems else {return}
        let sortedIndexPath = selectedItemsIndexPaths.sorted().reversed()
        for indexPath in sortedIndexPath {
            list.remove(at: indexPath.item)
        }
        collectionView.deleteItems(at: selectedItemsIndexPaths)
        checkTrashButtonNeedToDisplay()
    }
    
    @IBAction func addItems(_ sender: Any) {
        let range = (0...3)
        list.insert(contentsOf: range.map{101 + $0}, at: 0)
        collectionView.insertItems(at: range.map{IndexPath(item: $0, section: 0)})
    }
    
}

