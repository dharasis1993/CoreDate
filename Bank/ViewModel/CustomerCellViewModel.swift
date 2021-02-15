//
//  CustomerCellViewModel.swift
//  Bank
//
//  Created by dharasis behera on 01/02/21.
//

import Foundation

struct CustomerCellViewModel {
    private var customer: CustomerManagedDataModel

    init(with customer: CustomerManagedDataModel) {
        self.customer = customer
    }

    // MARK: - Helpers
    lazy var customerName: String = {
        return "\(customer.value(forKey: CustomerEntityAtrributes.name.rawValue) as? String ?? "")"
    }()

    lazy var customerDob: String = {
        return customer.value(forKey: CustomerEntityAtrributes.dob.rawValue) as? String ?? ""
    }()

    lazy var customerId: String = {
        let id: Int32 = customer.value(forKey: CustomerEntityAtrributes.customerId.rawValue) as! Int32
        return String(id)
    }()

    lazy var customerBalance: String = {
        let balance: Int32 = customer.value(forKey: CustomerEntityAtrributes.balance.rawValue) as! Int32
        return String(balance)
    }()

    lazy var customerBranch: String = {
        let branchCode: Int16 = customer.value(forKey: CustomerEntityAtrributes.branchCode.rawValue) as! Int16
        return String(branchCode)
    }()

    lazy var customerStatus: String = {
        return customer.value(forKey: CustomerEntityAtrributes.status.rawValue) as? String ?? ""
    }()

    lazy var customerPhoto: Data = {
        return customer.value(forKey: CustomerEntityAtrributes.status.rawValue) as? Data ?? Data()
    }()
}
