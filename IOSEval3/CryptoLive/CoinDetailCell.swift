//
//  CoinDetailCell.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit

class CoinDetailCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupCell(coin :PricingDetail){
        dateLabel.text = formattedDate(date: coin.date)
        priceLabel.text = formattedPrice(priceUsd: coin.priceUsd)
    }
}
