//
//  CounrtyCell.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/18.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

class CounrtyCell: UITableViewCell {
    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var selectedImg: UIImageView!
    
    var country: CurrencyMoneyCountry = CurrencyMoneyCountry(){
        didSet{
            currencyImageView.image = UIImage(named: country.name)
            nameLabel.text = country.name
            codeLabel.text = country.code
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.selectedImg.isHidden = !selected
        // Configure the view for the selected state
    }
    
}
