//
//  ItemStore.swift
//  Homepwner
//
//  Created by Abdelrhman on 6/26/17.
//  Copyright © 2017 Abdelrhman. All rights reserved.
//

import UIKit
class ItemStore{
    var allItems=[Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    @discardableResult func createItem()->Item{
        let newItem=Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ item:Item){
        if let index=allItems.index(of: item){
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int,to toIndex: Int){
        if fromIndex==toIndex{
            return
        }
        let movedItem=allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    func saveChanges()->Bool{
        print("Saving items to:\(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
    
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item]{
            allItems=archivedItems
        }
    }
   
}
