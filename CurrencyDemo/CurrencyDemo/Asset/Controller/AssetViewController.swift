//
//  ChargeViewController.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/19.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

//MARK: - ScreenConst
let screenBounds = UIScreen.main.bounds
let screenSize = screenBounds.size
let screenWidth = screenSize.width
let screenHeight = screenSize.height

//MARK: - Device
let iPhoneX: Bool = screenHeight == 812 ? true : false

let AssetStoreKey: String = "asset"

class AssetViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var naviTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    let cellIdentifier: String = "ChargeCell"
    
    var totalMoney: String = "0"{
        didSet{
            self.moneyLabel.text = totalMoney
        }
    }
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var chargeTable: UITableView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var visableBtn: UIButton!
    
    var assetStore: AssetStoreModel = AssetStoreModel(){
        didSet{
            self.chargeTable.reloadData()
            self.totalMoney = self.getTotoalMoeny()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let asset: AssetStoreModel? = AssetStoreModel.deserialize(from: UserDefaults.standard.string(forKey: AssetStoreKey))
        self.setUpTable()
        if let ass = asset{
            assetStore = ass
        }
        addBtn.onTap {
            self.navigationController?.pushViewController(NewAssetViewController(), animated: true)
        }
        visableBtn.onTap {
            self.visableBtn.isSelected = !self.visableBtn.isSelected
            if self.visableBtn.isSelected{
                self.moneyLabel.text = "****"
            }
            else{
                self.moneyLabel.text = self.totalMoney
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBtn.layer.cornerRadius = 22
        self.addBtn.layer.masksToBounds = true
        self.backBtn.onTap {
            self.goBack()
        }
        if iPhoneX {
            self.naviTopConstraint.constant = 44
            self.topViewHeightConstraint.constant = 249
        }
//        self.createGradient()
    }
    
    func createGradient() {
        let leftColor = UIColor(red: 0xFF/255, green: 0x89/255, blue: 0x0A/255, alpha: 1)
        let rightColor = UIColor(red: 0xFF/255, green: 0x7A/255, blue: 0x0A/255, alpha: 1)
        let gradientColors = [leftColor.cgColor, rightColor.cgColor]
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        if iPhoneX {
            gradientLayer.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 249)
        }
        else{
            gradientLayer.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 225)
        }
        self.topView.layer.addSublayer(gradientLayer)
    }
    
    func setUpTable() {
        self.chargeTable.delegate = self
        self.chargeTable.dataSource = self
        self.chargeTable.register(UINib.init(nibName: "ChargeCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.chargeTable.separatorStyle = .none
        self.chargeTable.tableFooterView = UIView()
    }
    
    func getTotoalMoeny() -> String {
        let incomeList: [AssetModel] = assetStore.list.filter(){$0.income.count > 0}
        let outcomeList: [AssetModel] = assetStore.list.filter(){$0.outcome.count > 0}
        let income: Int = incomeList.reduce(0, {$0 + Int($1.income)!})
        let outcome: Int = outcomeList.reduce(0, {$0 + Int($1.outcome)!})
        let total = income - outcome
        return String(total)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assetStore.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChargeCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ChargeCell
        cell.asset = assetStore.list[indexPath.row]
        return cell
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
