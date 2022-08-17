//
//  categsVc.swift
//  adam.ai
//
//  Created by mazen moataz on 11/08/2022.
//

import UIKit
import RealmSwift
class categsVc: UIViewController {

    @IBOutlet weak var categsCollelctionView: UICollectionView!
    @IBOutlet weak var filterNamesCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    var categsArr = ["Breakfast","Dinner","Dessert","Snacks"]
    var filterNamesArr = ["All","Hot Drinkes","Plates","Iced Coffee","Soda"]
    var productsArr:[Prodcuts] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        categsCollelctionView.delegate = self
        categsCollelctionView.dataSource = self
        filterNamesCollectionView.dataSource = self
        filterNamesCollectionView.delegate = self
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        categsCollelctionView.backgroundColor = UIColor.clear
        filterNamesCollectionView.backgroundColor = UIColor.clear
        productsCollectionView.backgroundColor = UIColor.clear
        print(productsArr)
    }
    func getData(){
        let realm = try! Realm()
        let myProducts = try! realm.objects(Prodcuts.self)
        for products in myProducts{
            productsArr.append(products)
            self.productsCollectionView.reloadData()
        }
    }
}

extension categsVc:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == categsCollelctionView.self){
            return categsArr.count
        }
        if(collectionView == filterNamesCollectionView.self){
            return filterNamesArr.count
        }
        if(collectionView == productsCollectionView.self){
            return productsArr.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == categsCollelctionView.self) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categsNames", for: indexPath) as! categsNamesCell
        cell.categLabel.text = categsArr[indexPath.row]
        cell.sizeToFit()
        cell.roundCorners([.allCorners], radius: 20)
        return cell
        }
        if(collectionView == filterNamesCollectionView.self){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterNamesCell", for: indexPath) as! FilterNamesCell
            cell.filterName.text = filterNamesArr[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell2", for: indexPath) as! ProductCell
            cell.productImg.image = UIImage(data: productsArr[indexPath.row].image,scale: 1)
            cell.productName.text = productsArr[indexPath.row].name
            cell.productPrice.text = productsArr[indexPath.row].price
            cell.productImg.roundCorners([.allCorners], radius: 20)
            cell.roundCorners([.allCorners], radius: 20)
            cell.backgroundColor = UIColor.white
            cell.productImg.backgroundColor = UIColor.black
            return cell
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == self.productsCollectionView){
            return 0.0365
        }else {
            return 17
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == self.productsCollectionView){
            return 17
        }else {
            return 1
        }
    }
    
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if(collectionView == categsCollelctionView.self) {
        let label = UILabel(frame: CGRect.zero)
        label.text = categsArr[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 66, height: view.frame.height * 0.087473)
    }
    if(collectionView == filterNamesCollectionView.self) {
        return CGSize(width: 5, height: 24)
    } else{
        return CGSize(width: collectionView.frame.width * 0.481, height: 245)
    }
   }
    
    
    
}


