//
//  PhotoJournalModel.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/14/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

final class PhotosJournalModel {
    private static let filename = "PhotoJournalList.plist"
    private init() {}
    
    static func savePhotoJournal(photoJournal: PhotoJournal) {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(photoJournal)
            // atomic =  write all at once
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static func getPhotoJournal() -> PhotoJournal? {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        var photoJournal: PhotoJournal?
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    photoJournal = try PropertyListDecoder().decode(PhotoJournal.self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return photoJournal
    }
    
}

