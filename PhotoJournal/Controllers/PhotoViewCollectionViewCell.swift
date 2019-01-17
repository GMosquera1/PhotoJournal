//
//  PhotoViewCollectionViewCell.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PhotoViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    override func prepareForReuse() {
        photoImage.image = nil
    }
    @IBOutlet weak var photoComment: UILabel!
    @IBOutlet weak var photoDate: UILabel!

    func updateCellUI(photos: PhotoJournal) {
        photoComment.text = photos.description
        photoDate.text = photos.createdAt
    }
    
    @IBAction func optionsButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "My Title", message: "message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Share", style: .default, handler: { (_) in
            print("User clicked 'Share' button")
        }))
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
            print("User clicked 'Edit' button")
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            print("User clicked 'Delete' button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("User clicked 'Cancel' button")
        }))
        
//        self.present(alert, animated: true, completion: {
//            print("completion block")
//        })
//        present(alert, animated: true, completion: nil)
    }
    
    
    
}
