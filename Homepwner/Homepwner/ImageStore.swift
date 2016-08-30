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
    }
    
    func getImage(forKey key : String) -> (UIImage?) {
        return imageCache.objectForKey(key) as? UIImage
    }
    
    func deleteImage(forKey key : String)  {
        imageCache.removeObjectForKey(key)
    }
}
