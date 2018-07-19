//
//  CurrencyViewController.swift
//  CurrencyDemo
//  汇率
//  Created by wushuying on 2018/7/18.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit
@_exported import Alamofire
@_exported import Closures

let url: String = "https://sp0.baidu.com/8aQDcjqpAAV3otqbppnN2DJv/api.php"

class CurrencyViewController: BaseViewController {
    var currencyName: String = "美元"
    var currency: CurrencyResponse?
    var country: CurrencyMoneyCountry = CurrencyMoneyCountry(){
        didSet{
            self.currencyName = country.name
            currencyImageView.image = UIImage(named: country.name)
            currencyNameLabel.text = self.currencyName
            currencyCodeLabel.text = country.code
            if country.name.elementsEqual("人民币") {
                self.currencyTF.text = self.rmbTF.text
            }
            else{
                let query: String = self.rmbTF.text! + "人民币等于多少" + self.currencyName
                self.convertRate(query: query)
            }
        }
    }
    @IBOutlet weak var currencyView: UIView!
    @IBOutlet weak var rmbTF: UITextField!
    @IBOutlet weak var currencyTF: UITextField!
    @IBOutlet weak var currencyImageView: UIImageView!
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "汇率换算"
        //获取初始的汇率以及热门币种
        country.code = "USD"
        country.hot = "yes"
        country.name = "美元"
        self.convertRate(query: "1人民币等于多少美元")
        self.currencyView.addTapGesture { (tap) in
            if let tab = self.currency?.data.first?.tab.filter({$0.txt.elementsEqual("热门")}){
                let vc: CountryViewController = CountryViewController()
                vc.tab = tab.first!
                vc.country = self.country
                vc.backClosure = {
                    (country) -> Void in
                    self.country = country
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        self.view.addTapGesture { (tap) in
            self.view.endEditing(true)
            let query: String = self.rmbTF.text! + "人民币等于多少" + self.currencyName
            self.convertRate(query: query)
        }
    }
    
    //调用百度api获取实时汇率
    func convertRate(query: String) {
        let hud = SwiftNotice.wait()
        Alamofire.request(url, method: HTTPMethod.get, parameters: ["query":query,"resource_id":"6017","format":"json"]).responseString { (response) in
            if let value = response.value{
                self.currency = CurrencyResponse.deserialize(from: value)!
                self.currencyTF.text = self.currency?.data.first?.number2
            }
            hud.clearAllNotice()
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
