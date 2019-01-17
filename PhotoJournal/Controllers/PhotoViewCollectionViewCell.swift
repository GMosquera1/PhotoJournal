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
    @IBOutlet weak var photoComment: UILabel!
    @IBOutlet weak var photoDate: UILabel!
    override func prepareForReuse() {
        photoImage.image = nil 
    }
    
}
