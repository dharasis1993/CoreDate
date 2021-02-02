//
//  CustomerViewController.swift
//  Bank
//
//  Created by dharasis behera on 31/01/21.
//

import UIKit

class CustomerViewController: UIViewController, UITextFieldDelegate {
    
    var customerAccountNumber: Int32?
    var customerViewModel: CustomerViewModel = CustomerViewModel()
    
    @IBOutlet weak var txtfldCustomerName: UITextField!
    @IBOutlet weak var txtfldDob: UITextField!
    @IBOutlet weak var txtfldBranch: UITextField!
    @IBOutlet weak var txtfldBalance: UITextField!
    @IBOutlet weak var imageCustomer: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtfldDob.delegate = self
        customerViewModel.customerAccountNumber = customerAccountNumber
    }
    
    @IBAction func onClickTransmit(sender: Any){
        customerViewModel.saveCustomer(accountNumber:String(customerAccountNumber ?? 0),name: txtfldCustomerName.text ?? "", dob: txtfldDob.text ?? "", branch: txtfldBranch.text ?? "", balance: txtfldBalance.text ?? "", photo: imageCustomer.image!) {
            performSegue(withIdentifier: Identifier.unwindIdentifier.rawValue, sender: nil)
            }
        }
}

extension CustomerViewController{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{        if textField == txtfldDob{
            return false
        }else{
            return true
        }
    }
}
