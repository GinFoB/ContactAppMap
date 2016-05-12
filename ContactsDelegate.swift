//
//  ContactsDelegate.swift
//  ContactsMap
//
//  Created by Akram khalifa on 20/04/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit
import ContactsUI
import CoreData

class ContactsDelegate: NSObject, CNContactPickerDelegate {
    
    var fetchedResultsController: NSFetchedResultsController?
    
    final func picker() -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = self
        let predicate = NSPredicate(format: "\(CNContactPostalAddressesKey).@count > 0")
        picker.predicateForEnablingContact = predicate
        return picker
    }

    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact){
       
        
        if let entity = fetchedResultsController?.fetchRequest.entity,
            let context = fetchedResultsController?.managedObjectContext{
            if let contactMO = NSEntityDescription.insertNewObjectForEntityForName(entity.name!, inManagedObjectContext: context) as? Contact {
                    contactMO.timeStamp = NSDate()
                    contactMO.identifier = contact.identifier
                
                do {
                    try context.save()
                } catch {
                    
                    abort()
                }

            }
            
        }
        
    }
    
}

