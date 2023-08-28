//
//  API.swift
//  IOSEval3
//
//  Created by Student04 on 28/08/2023.
//

import Foundation
import Alamofire
import AlamofireImage

let url = "https://api.coincap.io/v2/assets"
let decoder = JSONDecoder()

func getJCoinsList(completionHandler: @escaping (JCoinsList) -> ()){
    var jCoinsList :JCoinsList = JCoinsList()
    AF.request(url).response{ response in
        switch(response.result){
        case .success(let data):
            if let data = data{
                //let dataString = String(decoding: data, as: UTF8.self)
                //print(dataString)
                DispatchQueue(label: "delay").asyncAfter(deadline: .now() + 5){
                    DispatchQueue.main.async {
                        do{
                            jCoinsList = try decoder.decode(JCoinsList.self, from: data)
                            completionHandler(jCoinsList)
                        }catch{
                            print("CoinList Decode Failure")
                        }
                    }
                }
            }
        case .failure(let error):
            print("CoinList Failure: \(error)")
        }
    }
}

struct JCoinsList :Codable{
    var data :[Jcoin] = Array()
}

struct Jcoin :Codable{
    var id :String
    var rank :String
    var name :String
    var changePercent24Hr :String
    var priceUsd :String
    var explorer :String?
}

func getPricingDetails(coinName :String, completionHandler: @escaping (PricingDetailList) -> ()){
    var pricingList :PricingDetailList = PricingDetailList()
    AF.request("\(url)/\(coinName)/history?interval=d1").response{ response in
        switch(response.result){
        case .success(let data):
            if let data = data{
                let dataString = String(decoding: data, as: UTF8.self)
                print(dataString)
                DispatchQueue(label: "delay").asyncAfter(deadline: .now() + 5){
                    DispatchQueue.main.async {
                        do{
                            pricingList = try decoder.decode(PricingDetailList.self, from: data)
                            completionHandler(pricingList)
                        }catch{
                            print("DetailList Decode Failure")
                        }
                    }
                }
            }
        case .failure(let error):
            print("DetailList Failure \(error)")
        }
    }
}

struct PricingDetailList :Codable{
    var data :[PricingDetail] = Array()
}
struct PricingDetail :Codable{
    var priceUsd :String
    var date :String
}
