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
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var photoJournalViewController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
    }
    
    

    private func updateUI() {
        if let photoJournal = PhotosJournalModel.getPhotoJournal() {
            let image = UIImage(data: photoJournal.imageData)
            imageView.image = image
        } else {
            print("Photo Journal Does Not Exist")
        }
    }
    
    private func setupImagePickerViewController() {
        photoJournalViewController = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            
        }
    }

}

