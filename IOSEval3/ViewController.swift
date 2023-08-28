//
//  ViewController.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var coinsTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var coinsList :[Jcoin] = Array()
    
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
            self.coinsTableView.reloadData()
            self.loader.stopAnimating()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinsTableView.dequeueReusableCell(withIdentifier: "CoinViewCell", for: indexPath) as! CoinViewCell
        cell.setupCell(coin: coinsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CoinDetail") as! CoinDetailViewController
        vc.currentPrice = formattedPrice(priceUsd: coinsList[indexPath.row].priceUsd)
        vc.name = coinsList[indexPath.row].name
        vc.coinId = coinsList[indexPath.row].id
        navigationController?.pushViewController(vc , animated: true)
    }

}

