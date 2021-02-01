//
//  CustomerViewModel.swift
//  Bank
//
//  Created by dharasis behera on 01/02/21.
//

import Foundation
import UIKit

class CustomerViewModel{
    var customerAccountNumber: Int32?
    func saveCustomer(name:String, dob:String, branch: String, balance: String, photo:UIImage, with completion:()->()){
        let customerModel: CustomerManagedDataModel = CoreDataManager.sharedInstance.getManagedObject(for: CustomerEntityAtrributes.enityName.rawValue) as! CustomerManagedDataModel
        
        customerModel.customerId = customerAccountNumber ?? 0
        customerModel.name = name
        customerModel.balance = Int32(balance) ?? 0
        customerModel.branchCode = Int16(branch) ?? 0
        customerModel.dob = getDateFromString(date: dob)
        customerModel.status = "open"
        customerModel.photo = UIImage(named: "logo")?.pngData()
        CoreDataManager.sharedInstance.saveContext {
            completion()
        }
        
    }
    
    private func getDateFromString(date: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.date(from: date) ?? Date()
    }
    
}
