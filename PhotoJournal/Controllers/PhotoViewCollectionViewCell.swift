//
//  PhotoViewCollectionViewCell.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PhotoViewCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var optionsButton: UIButton!
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
        
    
    
}
