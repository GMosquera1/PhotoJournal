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
    
    
    public var multiplePhotos = [PhotoJournal]()
    
    private var imagePickerVC: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCV.dataSource = self
       multiplePhotos = PhotosJournalModel.getPhotoJournal()
     //   setupImagePickerViewController()
        print(DataPersistenceManager.documentsDirectory())
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        photoCV.reloadData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func optionsButton(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Share", style: .default, handler: { (_) in
            self.sharePhoto(index: sender.tag)
            print("User clicked 'Share' button")
        }))
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
            self.setView()
            print("User clicked 'Edit' button")
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            print("User clicked 'Delete' button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User clicked 'Cancel' button")
        }))
        
        
                self.present(alert, animated: true, completion: nil)
    }

    func setView() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
        viewController.modalPresentationStyle = .currentContext
        present(viewController, animated: true, completion: nil)
    }
    
    func sharePhoto(index: Int) {
        let imageToShare = multiplePhotos[index]
        let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
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
extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotosJournalModel.getPhotoJournal().count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = photoCV.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoViewCollectionViewCell else { return UICollectionViewCell()}
        let item = PhotosJournalModel.getPhotoJournal()[indexPath.row]
        cell.photoImage.image = UIImage.init(data: item.imageData)
        cell.photoComment.text = item.description
        cell.photoDate.text = item.dateFormattedString
        cell.optionsButton.tag = indexPath.row
        
        return cell
    }
    
    
}
