//
//  ContactsDelegate.swift
//  ContactsMap
//
//  Created by Akram khalifa on 20/04/2016.
//  Copyright © 2016 Akram khalifa. All rights reserved.
//

import UIKit
import ContactsUI

class ContactsDelegate: NSObject, CNContactPickerDelegate {
    
    final func picker() -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = self
        let predicate = NSPredicate(format: "\(CNContactPostalAddressesKey).@count > 0")
        picker.predicateForEnablingContact = predicate
        return picker
    }

    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact){
        print(contact)
    }
    
}
