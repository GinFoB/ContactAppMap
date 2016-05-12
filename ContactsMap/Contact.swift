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
    
    let store = CNContactStore()

    var name: String { get {
        if identifier != nil {
            do {
                
                let style = CNContactFormatterStyle.FullName
                let contact = try store.unifiedContactWithIdentifier(identifier!, keysToFetch:
                    [CNContactFormatter.descriptorForRequiredKeysForStyle(style)])
                return CNContactFormatter.stringFromContact(contact, style: style) ?? "###"
            }
            catch{
                print(error)
            }
        }
        return "Not Found"
        }
    }
    
    
    func contactWithKeys(keysToFetch: [CNKeyDescriptor]) throws -> CNContact? {
        var unifiedContact: CNContact?
        do {
            unifiedContact = try store.unifiedContactWithIdentifier(identifier!, keysToFetch:keysToFetch)
        } catch let error as NSError {
            throw error
        }
        return unifiedContact
    }

    
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
