//
//  PJModel.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/14/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {
    let createdAt: String
    let imageData: Data
    let description: String
}
