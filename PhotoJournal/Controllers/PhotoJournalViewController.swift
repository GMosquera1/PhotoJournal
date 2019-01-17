//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/14/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoJournalViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var photoCV: UICollectionView!
     var multiplePhotos = [PhotoJournal]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       multiplePhotos = PhotosJournalModel.getPhotoJournal()
     //   setupImagePickerViewController()
     
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
        present(vc, animated: true, completion: nil)
    }
    // perhaps this goes in the cell controller
//    private func updateUI() {
//        if let photoJournal = PhotosJournalModel.getPhotoJournal() {
//            let image = UIImage(data: photoJournal.imageData)
//
//        } else {
//            print("Photo Journal Does Not Exist")
//        }
//    }


}
