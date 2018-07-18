//
//  CountryViewController.swift
//  CurrencyDemo
//
//  Created by wushuying on 2018/7/18.
//  Copyright © 2018 wushuying. All rights reserved.
//

import UIKit

typealias BackClosureType = (CurrencyMoneyCountry) -> Void

class CountryViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var backClosure: BackClosureType?
    let cellIdentifier: String = "CounrtyCell"
    
    @IBOutlet weak var countryTableView: UITableView!
    
    var tab: CurrencyTab = CurrencyTab(){
        didSet{
//            self.countryTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "选择币种"
        self.configTab()
    }
    
    func configTab() {
        self.countryTableView.delegate = self
        self.countryTableView.dataSource = self
        self.countryTableView.register(UINib.init(nibName: "CounrtyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.moneys.money.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CounrtyCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CounrtyCell
        cell.country = self.tab.moneys.money[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = self.tab.moneys.money[indexPath.row]
        guard let _ = self.backClosure else {
            return
        }
        self.backClosure!(country)
        self.navigationController?.popViewController(animated: true)
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
