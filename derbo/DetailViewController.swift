//
//  DetailViewController.swift
//  derbo
//
//  Created by カナ on 2019/08/02.
//  Copyright © 2019 Kanako Ikegami. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var detailDate:[String] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        var textLabel: UILabel?
        var detailTextLabel: UILabel?
        cell.textLabel?.text = detailDate[indexPath.row]
        cell.detailTextLabel?.text = "0"
        //＞のマークがこれらしい
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        //        cell.imageView?.image = UIImage(name: “imageの名前”)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲートのプロパティとデータソースのプロパティをViewControllerクラスでつくる
        detailTableView.delegate = self
        detailTableView.dataSource = self
        //viewの追加
        view.addSubview(detailTableView)
        
    }
    
    @IBAction func detailAdd(_ sender: Any) {
        let alert = UIAlertController(title: "何につかうの？", message: "項目を記入するガネ", preferredStyle: .alert)
        
        //addTextField(configurationHandler:)の動作=テキストを追加
        alert.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) -> Void in
            
            //これなんじゃ？一回入れてみる
            self.detailDate.insert(alert.textFields!.first!.text!, at: 0)
            
            self.detailTableView.beginUpdates()
            
            let indexPath:IndexPath = IndexPath(row:0, section:0)
            
            self.detailTableView.insertRows(at: [indexPath], with: .automatic)
            self.detailTableView.endUpdates()
        })
        
        let cancelAction = UIAlertAction(title: "キャンセル",
                                         style: UIAlertAction.Style.cancel,
                                         handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        detailDate.remove(at: indexPath.row)
        detailTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}
