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
    func store(_ image: SharedImage)
}

protocol ImagesProviding {
    var sharedImages: [SharedImage] { get }
    func deleteImage(at index: Int)
}

final class ImageStorageManager: ImageStorageManaging, ImagesProviding {
    
    var sharedImages = [SharedImage]()
    
    func loadImagesFromStore() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SharedImages")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {                
                let sharedImage = SharedImage(
                    topText: data.value(forKey: "topText") as! String,
                    bottomText: data.value(forKey: "bottomText") as! String,
                    originalImage: UIImage(data: data.value(forKey: "originalImage") as! Data)!,
                    editedImage: UIImage(data: data.value(forKey: "editedImage") as! Data)!
                )
                sharedImages.append(sharedImage)
            }
        } catch {
            print("Failed")
        }
    }
    
    func store(_ sharedImage: SharedImage) {
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
        
        sharedImages.append(sharedImage)
    }
    
    func deleteImage(at index: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SharedImages")
        
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            if index < result.count {
                context.delete(result[index] as! NSManagedObject)
                sharedImages.remove(at: index)
            }
        } catch {
            print("Failed")
        }
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
}
