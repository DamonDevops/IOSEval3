//
//  CryptosViewController.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import UIKit

class CryptosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cryptosTable: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    var cryptosList :[Cryptos] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cryptos"
        loader.hidesWhenStopped = true
        loader.startAnimating()
        
        cryptosTable.dataSource = self
        cryptosTable.delegate = self
        cryptosTable.register(UINib(nibName: "CryptosCell", bundle: nil), forCellReuseIdentifier: "CryptosCell")
        cryptosTable.rowHeight = 200
        
        getCryptos(completionHandler: { result in
            self.cryptosList = result.coins
            self.cryptosTable.reloadData()
            self.loader.stopAnimating()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptosTable.dequeueReusableCell(withIdentifier: "CryptosCell", for: indexPath) as! CryptosCell
        cell.setupCell(crypto: cryptosList[indexPath.row])
        return cell
    }
    
}
