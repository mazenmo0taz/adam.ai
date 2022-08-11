//
//  AddProdcutVc.swift
//  adam.ai
//
//  Created by mazen moataz on 10/08/2022.
//

import UIKit
import PhotosUI
class AddProdcutVc: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    var imgsArr:[UIImage] = [UIImage(systemName: "square.and.arrow.up")!]
    
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
    }
  

}

extension AddProdcutVc: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PHPickerViewControllerDelegate{
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgsArr.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row < imgsArr.count){
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell" , for: indexPath) as! ProductImgCell
            cell.productImg.image = imgsArr[indexPath.row]
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
        if indexPath.row >= imgsArr.count{
            getPhotos()
        }
    }
    func getPhotos(){
        print(11111)
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 3
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
                    DispatchQueue.main.async {
                        print(img)
                        self.imgsArr.append(img)
                        self.collectionView.reloadData()
                    }
                }
            })
        }
    }
}
