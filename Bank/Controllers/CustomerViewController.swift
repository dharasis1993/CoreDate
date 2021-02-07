//
//  CustomerViewController.swift
//  Bank
//
//  Created by dharasis behera on 31/01/21.
//

import UIKit

class CustomerViewController: UIViewController {
    
    var customerAccountNumber: Int32?
    var customerViewModel: CustomerViewModel = CustomerViewModel()
    
    @IBOutlet weak var txtfldCustomerName: UITextField!
    @IBOutlet weak var txtfldDob: UITextField!
    @IBOutlet weak var txtfldBranch: UITextField!
    @IBOutlet weak var txtfldBalance: UITextField!
    @IBOutlet weak var imageCustomer: UIImageView!
    
    var imagePicker: ImagePicker!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtfldDob.delegate = self
        imagePicker = ImagePicker(presentingViewController: self, delegate: self)
        customerViewModel.customerAccountNumber = customerAccountNumber
    }
    
    @IBAction func onClickTransmit(sender: Any){
        customerViewModel.saveCustomer(accountNumber:String(customerAccountNumber ?? 0),name: txtfldCustomerName.text ?? "", dob: txtfldDob.text ?? "", branch: txtfldBranch.text ?? "", balance: txtfldBalance.text ?? "", photo: imageCustomer.image!) {
            performSegue(withIdentifier: Identifier.unwindIdentifier.rawValue, sender: nil)
            }
        }

    
    @IBAction func uploadImage(_ sender: Any) {
        imagePicker.presentImagePicker()
    }
}

extension CustomerViewController:  UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{        if textField == txtfldDob{
            return false
        }else{
            return true
        }
    }
}

extension CustomerViewController: ImagePickerDelegate{
    func didSelectphoto(image: UIImage?) {
        let pickerImage = image ?? UIImage(named: Default.defaultPlaceholder.rawValue)
            imageCustomer.image = pickerImage
    }
}
