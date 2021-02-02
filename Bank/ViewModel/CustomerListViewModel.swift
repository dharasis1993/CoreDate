//
//  CustomerListViewModel.swift
//  Bank
//
//  Created by dharasis behera on 31/01/21.
//

import Foundation

class CustomerListViewModel{
    var customerCellViewModel = [CustomerCellViewModel]()
    var customerBind: GenericObserver<[CustomerCellViewModel]> = GenericObserver([])

    init() { fetchCustomerFromPersistantStore() }

    private func fetchCustomerFromPersistantStore(){
        CoreDataManager.sharedInstance.fetchConetext(entityName: CustomerEntityAtrributes.enityName.rawValue) {[weak self = self] (fetchedresultList: [Any])  in
            for customer in fetchedresultList{
                customerCellViewModel.append(CustomerCellViewModel(with: customer as! CustomerManagedDataModel))
            }

            self?.customerBind.value = customerCellViewModel
        }
    }
}
