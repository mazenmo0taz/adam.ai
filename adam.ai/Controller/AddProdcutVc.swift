//
//  AddProdcutVc.swift
//  adam.ai
//
//  Created by mazen moataz on 10/08/2022.
//

import UIKit
import PhotosUI
import RealmSwift
class AddProdcutVc: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    var productsArr:[Prodcuts] = []
    var imgsDataArr:[NSData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        //round corners for textfields and button
        textField1.roundCorners([.allCorners], radius: 20)
        textField2.roundCorners([.allCorners], radius: 20)
        textField3.roundCorners([.allCorners], radius: 20)
        textField4.roundCorners([.allCorners], radius: 20)
        textField5.roundCorners([.allCorners], radius: 20)
        doneBtn.roundCorners([.allCorners], radius: 20)
        // placeholder padding for textfields
        textField1.placeholderPadding( paddingSize: 22)
        textField2.placeholderPadding( paddingSize: 22)
        textField3.placeholderPadding( paddingSize: 22)
        textField4.placeholderPadding( paddingSize: 22)
        textField5.placeholderPadding( paddingSize: 22)
//        let categScreen = storyboard?.instantiateViewController(identifier: "categsScreenID") as! categsVc
//        categScreen.productsArr = productsArr
//        print("add prod screen = \(productsArr[0].name)")
//        print(productsArr)
    }

    @IBAction func doneBtnPressed(_ sender: Any) {
        let product = Prodcuts()
        product.image = imgsDataArr[0]
        product.name = textField1.text ?? "No name"
        product.price = textField5.text ?? "0.0"
        let realm = try! Realm()
        try! realm.write{
            realm.add(product)
            print("prod added successfully")
        }
        
    }
    

    
}

extension AddProdcutVc: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgsDataArr.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row < imgsDataArr.count){
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell" , for: indexPath) as! ProductImgCell
            cell.productImg.image = UIImage(data: imgsDataArr[indexPath.row] as Data)
            cell.productImg.roundCorners([.allCorners], radius: 10)
            cell.dltBtn.roundCorners([.allCorners], radius: 12.5)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plusCell" , for: indexPath) as! AddPhotoCell
            cell.plusImg.roundCorners([.allCorners], radius:10)
           return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 91, height: 91)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row >= imgsDataArr.count{
            getPhotos()
        }
    }
 
}

extension AddProdcutVc: PHPickerViewControllerDelegate {
    func getPhotos() {
        
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 2
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)
        for res in results {
            res.itemProvider.loadObject(ofClass: UIImage.self, completionHandler:{
                (image,error) in
                if let img = image as? UIImage{
                    self.imgsDataArr.append(img.jpegData(compressionQuality: 0.5)! as NSData)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            })
        }
        
    }
    

}

