//
//  Constant.swift
//  Bank
//
//  Created by dharasis behera on 02/02/21.
//

import Foundation
enum CustomerEntityAtrributes: String {
    case enityName = "Customer"
    case balance = "balance"
    case branchCode = "branchCode"
    case customerId = "customerId"
    case dob = "dob"
    case name = "name"
    case photo = "photo"
    case status = "status"
}

enum BankConstant: Int32 {
    case defaultAccountNUmber = 11011011
}

enum Identifier: String {
    case unwindIdentifier = "unwindIdentifier"
    case tableViewCellIdentifier = "listCellIdentifier"
}

enum Default: String {
    case defaultPlaceholder = "avtar"
    case deleteText = "delete"

}
