//
//  Contact.swift
//  ContactsMap
//
//  Created by Akram khalifa on 20/04/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import Foundation
import CoreData
import Contacts


class Contact: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    
    final class func EntityName() -> String {
        return "Contact"
    }
    
    final class func all() {
        
        print("Tous mes contacts")
        
        let keysToFetch = [CNContactGivenNameKey,CNContactFamilyNameKey]
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
        
        do {
            
            try CNContactStore().enumerateContactsWithFetchRequest(fetchRequest) { (contact, _) in
                
                print(contact.familyName)
            }

        }
        
        catch{
            fatalError("Error")
        }
        
    }
    
    
    
    
}
