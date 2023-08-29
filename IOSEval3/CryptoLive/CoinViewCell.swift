//
//  CoinViewCell.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit
import SafariServices

class CoinViewCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var rankContainer: UIView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    var url :String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.cornerRadius = 15
        container.layer.masksToBounds = true
        
        infoButton.layer.borderWidth = 2
        infoButton.layer.cornerRadius = 15
        
        rankContainer.layer.cornerRadius = 15
        rankContainer.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupCell(coin :Jcoin){
        if let url = coin.explorer{
            self.url = url
        }
        rankLabel.text = coin.rank
        nameLabel.text = coin.name
        priceLabel.text = formattedPrice(priceUsd: coin.priceUsd)
        if let currentPercent = Double(coin.changePercent24Hr){
            changeLabel.text = "\(String(format: "%.2f", currentPercent)) %"
            if(currentPercent > 0){
                changeLabel.textColor = .systemGreen
            }else{
                changeLabel.textColor = .systemRed
            }
        }
        
    }
    
   @IBAction func goToSafari(_ sender: Any) {
       if let url = URL(string: self.url! ){
           //let vc = SFSafariViewController (url: url)
           //self.present(vc, animated: true)
           print("clickiticlick \(url)")
           }
   }
}
