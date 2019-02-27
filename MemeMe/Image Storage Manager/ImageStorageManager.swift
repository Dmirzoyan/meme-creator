//
//  ImageStorageManager.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/27/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit
import CoreData

protocol ImageStorageManaging {
    func loadImagesFromStore()
    func save(_ meme: Meme)
}

final class ImageStorageManager: ImageStorageManaging {
    
    var sharedImages = [Meme]()
    
    func loadImagesFromStore() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SharedImages")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "topText") as! String)
            }
        } catch {
            print("Failed")
        }
    }
    
    func save(_ sharedImage: Meme) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SharedImages", in: context)
        let newImage = NSManagedObject(entity: entity!, insertInto: context)
        
        newImage.setValue(sharedImage.topText, forKey: "topText")
        newImage.setValue(sharedImage.bottomText, forKey: "bottomText")
        newImage.setValue(sharedImage.originalImage.pngData(), forKey: "originalImage")
        newImage.setValue(sharedImage.editedImage.pngData(), forKey: "editedImage")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}
