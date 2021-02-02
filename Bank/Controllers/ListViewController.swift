//
//  ListViewController.swift
//  Bank
//
//  Created by dharasis behera on 31/01/21.
//

import UIKit

class ListViewController: UITableViewController{
    private var customerListViewModel: CustomerListViewModel = CustomerListViewModel()

    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        customerListViewModel.customerBind.bind {[weak self = self] (customer: [CustomerCellViewModel]) in
            
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! CustomerViewController
        destinationVC.customerAccountNumber = Int32(String(BankConstant.defaultAccountNUmber.rawValue)+String(customerListViewModel.customerCellViewModel.count))
    }
    
    
    @IBAction func unwindAction(for unwindSegue: UIStoryboardSegue) {
        let sourceVC = unwindSegue.source as! CustomerViewController
        guard let newCustomer = sourceVC.customerViewModel.customerModel else { return }
        customerListViewModel.customerCellViewModel.append(CustomerCellViewModel(with: newCustomer))
        tableView.insertRows(at: [IndexPath(row:    customerListViewModel.customerCellViewModel.count-1, section: 0)], with: .fade)
    }
}

extension ListViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.tableViewCellIdentifier.rawValue, for: indexPath) as! ListCustomCell
        cell.customerList =    customerListViewModel.customerCellViewModel[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        customerListViewModel.customerCellViewModel.count
    }
}


