//
//  ViewController.swift
//  derbo
//
//  Created by カナ on 2019/07/24.
//  Copyright © 2019 Kanako Ikegami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //セルの数
    var data:[String] = []
    
    @IBOutlet weak var firstTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //以下プロトコルの必須装備
    //セルの数をかえす、プラスで追加された分をここの数に返したい
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //セルのインスタンスを生成するメソッド、value1のスタイルでいきたい（RightDetailのパターンで、セルを用意したい）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        var textLabel: UILabel?
        var detailTextLabel: UILabel?
        //ほんまは左に画像がほしいよね、、画像用意できたらこのプロパティを設定しましょうぞ
        //        var imageView: UIImageView?
        cell.textLabel?.text = data[indexPath.row]
        cell.detailTextLabel?.text = "0"
        //＞のマークがこれらしい
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        //        cell.imageView?.image = UIImage(name: “imageの名前”)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //initを設定、groupedは、グレーでまとまってるでスタイル
        //firstTableView = UITableView(frame: self.view.frame, style: UITableView.Style.grouped)
        //デリゲートのプロパティとデータソースのプロパティをViewControllerクラスでつくる
        firstTableView.delegate = self
        firstTableView.dataSource = self
        //viewの追加
        view.addSubview(firstTableView)
    }
    
    
    @IBAction func addalert(_ sender: Any) {
        let alert = UIAlertController(title: "出金口座は？", message: "口座名を入力してね", preferredStyle: .alert)
        //preferredStyleは、アラートでいいのか？
        
        //addTextField(configurationHandler:)の動作=テキストを追加
        alert.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (UIAlertAction) -> Void in
            
            //これなんじゃ？一回入れてみる
            self.data.insert(alert.textFields!.first!.text!, at: 0)
            
            self.firstTableView.beginUpdates()
            
            let indexPath:IndexPath = IndexPath(row:0, section:0)
            
            self.firstTableView.insertRows(at: [indexPath], with: .automatic)
            self.firstTableView.endUpdates()
        })
        
        let cancelAction = UIAlertAction(title: "キャンセル",
                                         style: UIAlertAction.Style.cancel,
                                         handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}


