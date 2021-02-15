//
//  ListCustomCell.swift
//  Bank
//
//  Created by dharasis behera on 31/01/21.
//

import UIKit

class ListCustomCell: UITableViewCell {

    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblAccountNumber: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblBranch: UILabel!

    var customerList: CustomerCellViewModel? {
        didSet {
            if var customerList = customerList {
                lblCustomerName.text = customerList.customerName
                lblAccountNumber.text = String(customerList.customerId)
                lblBalance.text = String(customerList.customerBalance)
                lblBranch.text = String(customerList.customerBranch)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
