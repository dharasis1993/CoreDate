//
//  DatePicker.swift
//  Bank
//
//  Created by dharasis behera on 31/01/21.
//

import UIKit

class DateTypeTextField: UITextField, UITextFieldDelegate {
    let datePicker = UIDatePicker()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addDatePicker()
    }

    func addDatePicker() {
           // Formate Date
           datePicker.datePickerMode = .date

          // ToolBar
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))

        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)

        self.inputAccessoryView = toolbar
        self.inputView = datePicker

            if #available(iOS 13.4, *) {
                      datePicker.preferredDatePickerStyle = .wheels
                  }

        }
    @objc func donedatePicker() {

     let formatter = DateFormatter()
     formatter.dateFormat = "dd/MM/yyyy"
        self.text = formatter.string(from: datePicker.date)
        self.endEditing(true)
        self.resignFirstResponder()

   }

   @objc func cancelDatePicker() {
      self.endEditing(true)
        self.resignFirstResponder()

    }
    }
