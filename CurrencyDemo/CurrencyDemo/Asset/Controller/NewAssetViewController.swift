//
//  NewChargeViewController.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

class NewAssetViewController: BaseViewController {

    @IBOutlet weak var chargeNameTF: UITextField!
    @IBOutlet weak var incomeTF: UITextField!
    @IBOutlet weak var outComeTF: UITextField!
    @IBOutlet weak var SureBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "资产管理"
        self.SureBtn.layer.cornerRadius = 22
        self.SureBtn.layer.masksToBounds = true
        self.SureBtn.onTap {
            if (self.chargeNameTF.text?.count)! > 0 {
                if (self.outComeTF.text?.count)! > 0 || (self.incomeTF.text?.count)! > 0{
                    let newAsset = self.composeNewAsset()
                    var storeAsset: AssetStoreModel? = AssetStoreModel.deserialize(from: UserDefaults.standard.string(forKey: AssetStoreKey))
                    if var s = storeAsset{
                        s.list.append(newAsset)
                        UserDefaults.standard.setValue(s.toJSONString(), forKey: AssetStoreKey)
                        UserDefaults.standard.synchronize()
                    }
                    else{
                        storeAsset = AssetStoreModel(list: [newAsset])
                        UserDefaults.standard.setValue(storeAsset?.toJSONString(), forKey: AssetStoreKey)
                        UserDefaults.standard.synchronize()
                    }
                    SwiftNotice.noticeOnStatusBar("添加成功", autoClear: true, autoClearTime: 1)
                    self.navigationController?.popViewController(animated: true)
                }
                else{
                    SwiftNotice.noticeOnStatusBar("请填写支出金额或收入金额", autoClear: true, autoClearTime: 1)
                }
            }
            else{
                SwiftNotice.noticeOnStatusBar("请填写类目名称", autoClear: true, autoClearTime: 1)
            }
        }
    }
    
    func composeNewAsset() -> AssetModel{
        var newAsset: AssetModel = AssetModel()
        newAsset.name = chargeNameTF.text!
        if (self.outComeTF.text?.count)! > 0{
            newAsset.outcome = self.outComeTF.text!
        }
        else{
            newAsset.income = self.incomeTF.text!
        }
        let time = self.dateConvertYearAndMonth()
        newAsset.year = time.year
        newAsset.month = time.month
        return newAsset
    }
    
    /// 根据当前时间获取年月
    ///
    /// - Returns: ("2018","06")
    func dateConvertYearAndMonth() -> (year: String, month: String){
        let now = Date()
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "YYYY MM"
        let date = formatter.string(from: now)
        return (date.components(separatedBy: " ").first!, date.components(separatedBy: " ").last!)
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
