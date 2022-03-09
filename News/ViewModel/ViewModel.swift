//
//  ViewController.swift
//  News
//
//  Created by Adilet on 7/3/22.
//
import UIKit
class ViewModelTableView: UITableView{
    func setup(){
        self.dataSource = self
    }
var tableView = TableViewModel()
}
//extension ViewModelTableView : UITableViewDataSource{
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        UITableViewCell()
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        .zero
//    }
//    
//}

