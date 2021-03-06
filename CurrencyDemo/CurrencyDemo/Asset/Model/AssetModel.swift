//
//  ChargeModel.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import Foundation

struct AssetModel: HandyJSON {
    /// 类目
    var name: String = ""
    /// 收入金额
    var income: String = ""
    /// 支出金额
    var outcome: String = ""
    /// 年份
    var year: String = ""
    /// 月份
    var month: String = ""
}

struct AssetStoreModel: HandyJSON {
    var list: [AssetModel] = []
}
