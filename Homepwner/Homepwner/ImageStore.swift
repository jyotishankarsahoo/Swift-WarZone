//
//  ImageStore.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 30/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ImageStore {

    let imageCache = NSCache()
    
    func setImage(image : UIImage, forkey key : String)  {
        imageCache.setObject(image, forKey: key)
        let imagePath = self.imageURLForKey(key)
        if let imageData =  UIImageJPEGRepresentation(image, 0.5){
            imageData.writeToURL(imagePath, atomically: true)
        }
    }
    
    func getImage(forKey key : String) -> (UIImage?) {
        if let existingImage = imageCache.objectForKey(key) as? UIImage{
            return existingImage
        }
        let imageURL = self.imageURLForKey(key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else{
            return nil;
        }
        imageCache.setObject(imageFromDisk, forKey: key)
        return imageFromDisk
    }
    
    func deleteImage(forKey key : String)  {
        imageCache.removeObjectForKey(key)
        let imageURL =  self.imageURLForKey(key)
        do{
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
        }catch{
            print("error while removing image from disk \(error)")
        }
    }
    
    func imageURLForKey(key : String) -> NSURL {
        let documentDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.URLByAppendingPathComponent(key)
    }
}
