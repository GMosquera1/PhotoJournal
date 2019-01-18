//
//  LibraryViewController.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/17/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import AVFoundation

class LibraryViewController: UIViewController {

    
    @IBOutlet weak var commentText: UITextView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
     private var imagePickerViewController: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePickerViewController()
        updateUI()
    }
    
    private func updateUI() {
      
        
    }
    private func setupImagePickerViewController() {
        imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
           
        }
    
    }
    
    private func showImagePickerController() {
        present(imagePickerViewController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryButtonPressed(_ sender: UIBarButtonItem) {
        imagePickerViewController.sourceType = .photoLibrary
        showImagePickerController()
        
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imagePickerViewController.sourceType = .camera
        showImagePickerController()
    }
    private func savePhotoJournal(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.5) {
            let photoJournal = PhotoJournal.init(createdAt: "no date", imageData: imageData, description: "cool wallpaper")
            PhotosJournalModel.addPhoto(photo: photoJournal)
        }
    }
    
}

extension LibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            
            
        }
        dismiss(animated: true, completion: nil)
    }
}
