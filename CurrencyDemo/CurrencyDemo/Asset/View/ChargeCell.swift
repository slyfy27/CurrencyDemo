//
//  ChargeCell.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

class ChargeCell: UITableViewCell {
    
    @IBOutlet weak var chargeNameLabel: UILabel!
    @IBOutlet weak var chargeMoneyLabel: UILabel!
    
    var asset: AssetModel = AssetModel(){
        didSet{
            chargeNameLabel.text = asset.name
            if asset.income.count > 0 {
                chargeMoneyLabel.text = "+" + asset.income
                chargeMoneyLabel.textColor = UIColor.init(red: 255/255.0, green: 93/255.0, blue: 93/255.0, alpha: 1.0)
            }
            else{
                chargeMoneyLabel.text = "-" + asset.outcome
                chargeMoneyLabel.textColor = UIColor.init(red: 33/255.0, green: 211/255.0, blue: 66/255.0, alpha: 1.0)
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
