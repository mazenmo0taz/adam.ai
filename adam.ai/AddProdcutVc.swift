//
//  AddProdcutVc.swift
//  adam.ai
//
//  Created by mazen moataz on 10/08/2022.
//

import UIKit

class AddProdcutVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var imagesArr = [UIImage]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"productImg" , for: indexPath) as! ProductImg
        cell.ProductImg.image = imagesArr[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self 
    }
   
    // MARK: - Navigation
    

}
