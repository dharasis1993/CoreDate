//
//  CustomerManagedDataModel+CoreDataClass.swift
//  Bank
//
//  Created by dharasis behera on 01/02/21.
//
//

import Foundation
import CoreData

public class CustomerManagedDataModel: NSManagedObject {
    @NSManaged public var balance: Int32
    @NSManaged public var branchCode: Int16
    @NSManaged public var customerId: Int32
    @NSManaged public var dob: Date?
    @NSManaged public var name: String?
    @NSManaged public var photo: Data?
    @NSManaged public var status: String?
}
