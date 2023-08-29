//
//  ViewController.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var filteredSegment: UISegmentedControl!
    @IBOutlet weak var coinsTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var coinsList :[Jcoin] = Array()
    var filterableCoinList :[Jcoin] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinsTableView.dataSource = self
        coinsTableView.delegate = self
        coinsTableView.register(UINib(nibName: "CoinViewCell", bundle: nil), forCellReuseIdentifier: "CoinViewCell")
        coinsTableView.rowHeight = 150
        
        loader.hidesWhenStopped = true
        loader.startAnimating()
        
        getJCoinsList(completionHandler: { result in
            self.coinsList = result.data
            self.filterableCoinList = self.coinsList
            self.coinsTableView.reloadData()
            self.loader.stopAnimating()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterableCoinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinsTableView.dequeueReusableCell(withIdentifier: "CoinViewCell", for: indexPath) as! CoinViewCell
        cell.setupCell(coin: filterableCoinList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CoinDetail") as! CoinDetailViewController
        vc.currentPrice = formattedPrice(priceUsd: filterableCoinList[indexPath.row].priceUsd)
        vc.name = filterableCoinList[indexPath.row].name
        vc.coinId = filterableCoinList[indexPath.row].id
        navigationController?.pushViewController(vc , animated: true)
    }
    
    @IBAction func filteredSelected(_ sender: Any) {
        switch(filteredSegment.selectedSegmentIndex){
        case 0:
            self.filterableCoinList = self.coinsList
            coinsTableView.reloadData()
        case 1:
            self.filterableCoinList.sort(by: { $0.changePercent24Hr <= $1.changePercent24Hr})
            coinsTableView.reloadData()
        case 2:
            self.filterableCoinList.sort(by: { $0.changePercent24Hr >= $1.changePercent24Hr})
            coinsTableView.reloadData()
        default:
            print("TODO error check")
        }
    }
    
}

