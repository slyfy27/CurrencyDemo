//
//  CurrencyModel.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import Foundation
@_exported import HandyJSON

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
