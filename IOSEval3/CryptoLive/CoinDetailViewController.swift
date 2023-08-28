//
//  CoinDetailViewController.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit

class CoinDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var detailList: UITableView!
    var pricingList :[PricingDetail] = Array()
    var coinId :String?
    var name :String?
    var currentPrice :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.hidesWhenStopped = true
        loader.startAnimating()
        
        detailList.dataSource = self
        detailList.delegate = self
        detailList.register(UINib(nibName: "CoinDetailCell", bundle: nil), forCellReuseIdentifier: "CoinDetailCell")
        detailList.rowHeight = 100
        
        nameLabel.text = name
        currentPriceLabel.text = currentPrice
        
        if let coinId = coinId{
            getPricingDetails(coinName: coinId, completionHandler: { result in
                self.pricingList = result.data
                self.pricingList.reverse()
                self.detailList.reloadData()
                self.loader.stopAnimating()
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pricingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailList.dequeueReusableCell(withIdentifier: "CoinDetailCell") as! CoinDetailCell
        cell.setupCell(coin: pricingList[indexPath.row])
        return cell
    }

}
