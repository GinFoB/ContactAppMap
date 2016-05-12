//
//  ContactSegue.swift
//  ContactsMap
//
//  Created by Akram khalifa on 20/04/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit
import ContactsUI

class ContactSegue: UIStoryboardSegue {
    
    var contact: Contact?
    
    override func perform() {
        if let contact = contact {
            do {
                if let contact = try contact.contactWithKeys([CNContactViewController.descriptorForRequiredKeys()]) {
                    let contactVC = CNContactViewController(forContact: contact)
                    sourceViewController.navigationController?.pushViewController(contactVC, animated: true)
                }
            } catch {
                
            }
        }

    }
    
}
