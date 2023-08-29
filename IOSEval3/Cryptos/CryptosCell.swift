//
//  CryptosCell.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit
import AlamofireImage
class CryptosCell: UITableViewCell {

    @IBOutlet weak var cryptoLabel: UILabel!
    @IBOutlet weak var cryptoIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(crypto :Cryptos){
        cryptoLabel.text = crypto.name
        cryptoIcon.af.setImage(withURL: URL(string: crypto.icon)!, placeholderImage: UIImage(systemName: "photo"))
    }
    
}
