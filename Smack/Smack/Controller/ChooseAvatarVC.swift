//
//  ChooseAvatarVC.swift
//  Smack
//
//  Created by Pooya on 1/8/1397 AP.
//  Copyright © 1397 Binogoo. All rights reserved.
//

import UIKit

class ChooseAvatarVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    var avatarType = AvatarType.dark
    
    @IBOutlet weak var avatarsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarsCollectionView.dataSource = self
        avatarsCollectionView.delegate = self
    
    }
    @IBAction func onSegmentChanged(_ sender: Any) {
        if segmentControll.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        avatarsCollectionView.reloadData()
        
    }
    @IBAction func onBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AVATAR_CELL, for: indexPath) as? AvatarCollectionCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfCollumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numberOfCollumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 20
        let padding: CGFloat = 40
        
        let cellDimention = (UIScreen.main.bounds.width - padding - (numberOfCollumns - 1) * spaceBetweenCells) / numberOfCollumns
        
        return CGSize(width: cellDimention, height: cellDimention)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == AvatarType.dark {
            UserDataService.instance.setAvatarName(name: "dark\(indexPath.item)")
        } else {
            UserDataService.instance.setAvatarName(name: "light\(indexPath.item)")
        }
        dismiss(animated: true, completion: nil)
    }
    

}
