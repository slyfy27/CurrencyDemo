//
//  CurrencyViewController.swift
//  CurrencyDemo
//  汇率
//  Created by wushuying on 2018/7/18.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

let url: String = "https://sp0.baidu.com/8aQDcjqpAAV3otqbppnN2DJv/api.php"

struct CurrencyResponse: HandyJSON {
    var status: String = ""
    var t: String = ""
    var set_cache_time: String = ""
    var data: [CurrencyData] = []
}

struct CurrencyData: HandyJSON {
    var StdStg: String = ""
    var StdStl: String = ""
    var _update_time: String = ""
    var cambrian_appid: String = ""
    var code1: String = ""
    var code2: String = ""
    var content1: String = ""
    var content2: String = ""
    var iconlink: String = ""
    var key: String = ""
    var support: String = ""
    var tab: [CurrencyTab] = []
    var url: String = ""
    var SiteId: String = ""
    var number1: String = ""
    var number2: String = ""
}

struct CurrencyTab: HandyJSON {
    var id: String = ""
    var moneys: CurrencyMoney = CurrencyMoney()
    var txt: String = ""
}

struct CurrencyMoney: HandyJSON {
    var money: [CurrencyMoneyCountry] = []
}

struct CurrencyMoneyCountry: HandyJSON {
    var code: String = ""
    var hot: String = ""
    var name: String = ""
}

class CurrencyViewController: UIViewController {
    var currency: CurrencyResponse = CurrencyResponse()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "汇率换算"
        //获取初始的汇率以及热门币种
        self.convertRate(query: "1美元等于多少人民币")
    }
    
    //调用百度api获取实时汇率
    func convertRate(query: String) -> Void {
        Alamofire.request(url, method: HTTPMethod.get, parameters: ["query":query,"resource_id":"6017","format":"json"]).responseString { (response) in
            if let value = response.value{
                self.currency = CurrencyResponse.deserialize(from: value)!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
