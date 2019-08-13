//
//  DetailViewController.swift
//  derbo
//
//  Created by カナ on 2019/08/02.
//  Copyright © 2019 Kanako Ikegami. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var moneyDate:[String] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moneyDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
