//
//  PhotoJournalModel.swift
//  PhotoJournal
//
//  Created by Genesis Mosquera on 1/14/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import Foundation

final class PhotosJournalModel {
    private static let filename = "PhotoJournal.plist"
    //private init() {}
    private static var multiplePhotos = [PhotoJournal]()
    
    static func getPhotoJournal() -> [PhotoJournal] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        //var photoJournal: PhotoJournal?
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
        multiplePhotos = try PropertyListDecoder().decode([PhotoJournal].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        multiplePhotos = multiplePhotos.sorted(by: {$0.createdAt > $1.createdAt})
        return multiplePhotos
    }
    static func addPhoto(photo: PhotoJournal) {
        multiplePhotos.append(photo)
        savePhoto()
    }
    static func savePhoto() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(multiplePhotos)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    static func updateItem(updatedItem: PhotoJournal, atIndex index: Int) {
        multiplePhotos[index] = updatedItem
        savePhoto()
    }
}

