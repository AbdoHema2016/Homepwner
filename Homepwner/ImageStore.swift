//
//  ImageStore.swift
//  Homepwner
//
//  Created by Abdelrhman on 7/3/17.
//  Copyright © 2017 Abdelrhman. All rights reserved.
//

import UIKit

class ImageStore{
    
    let cache = NSCache<NSString,UIImage>()

    func setImage(_ image:UIImage, forKey key:String){
        cache.setObject(image, forKey: key as NSString)
        let url = imageURL(forKey: key)
        
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            let _ = try? data.write(to: url,options: [.atomic])
        }
    }
    
    func image(forKey key:String)->UIImage?{
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil }
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
    
    func deleteImage(forKey key:NSString){
        cache.removeObject(forKey: key as NSString)
        let url = imageURL(forKey: key as String)
        do {
            try FileManager.default.removeItem(at: url)
        } catch let deleteError{
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    func imageURL(forKey key:String) -> URL{
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent(key)
    }
    
}
