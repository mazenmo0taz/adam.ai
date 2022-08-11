//
//  categsVc.swift
//  adam.ai
//
//  Created by mazen moataz on 11/08/2022.
//

import UIKit

class categsVc: UIViewController {

    @IBOutlet weak var catgesCollelctionView: UICollectionView!
    var categsArr = ["Breakfast","Dinner","Dessert","Snacks"]
    override func viewDidLoad() {
        super.viewDidLoad()
        catgesCollelctionView.delegate = self
        catgesCollelctionView.dataSource = self
    }
    
}

extension categsVc:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categsNames", for: indexPath) as! categsNamesCell
        cell.categLabel.text = categsArr[indexPath.row]
        cell.sizeToFit()
        cell.roundCorners([.allCorners], radius: 20)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let label = UILabel(frame: CGRect.zero)
        label.text = categsArr[indexPath.item]
        label.sizeToFit()
    return CGSize(width: label.frame.width + 60, height: view.frame.height * 0.087473)
            }
    
    
    
}
