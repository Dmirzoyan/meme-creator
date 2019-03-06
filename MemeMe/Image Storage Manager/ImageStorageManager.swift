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
    var sharedImages: [SharedImage] { get }
    func store(_ image: SharedImage)
    func deleteImage(at index: Int)
}

final class ImageStorageManager: ImageStorageManaging {
    
    var sharedImages = [SharedImage]()
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func loadImagesFromStore() {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SharedImages")
        request.returnsObjectsAsFaults = false
        
        do {
            let objects = try context.fetch(request)
            for object in objects {
                sharedImages.append(sharedImage(for: object as! NSManagedObject))
            }
        } catch {}
    }
    
    func store(_ sharedImage: SharedImage) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SharedImages", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        set(object, for: sharedImage)
        
        do { try context.save() }
        catch {}
        
        sharedImages.append(sharedImage)
    }
    
    func deleteImage(at index: Int) {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SharedImages")
        request.returnsObjectsAsFaults = false
        
        do {
            let objects = try context.fetch(request)
            if index < objects.count {
                context.delete(objects[index] as! NSManagedObject)
                sharedImages.remove(at: index)
            }
        } catch {}
        
        do { try context.save() }
        catch {}
    }
    
    private func sharedImage(for object: NSManagedObject) -> SharedImage {
        return SharedImage(
            topText: object.value(forKey: "topText") as! String,
            bottomText: object.value(forKey: "bottomText") as! String,
            originalImage: UIImage(data: object.value(forKey: "originalImage") as! Data)!,
            editedImage: UIImage(data: object.value(forKey: "editedImage") as! Data)!
        )
    }
    
    private func set(_ object: NSManagedObject, for sharedImage: SharedImage) {
        object.setValue(sharedImage.topText, forKey: "topText")
        object.setValue(sharedImage.bottomText, forKey: "bottomText")
        object.setValue(sharedImage.originalImage.pngData(), forKey: "originalImage")
        object.setValue(sharedImage.editedImage.pngData(), forKey: "editedImage")
    }
}
