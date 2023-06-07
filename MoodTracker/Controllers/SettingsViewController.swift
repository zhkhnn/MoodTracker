//
//  SettingsViewController.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 02.12.2022.
//

import UIKit
import SnapKit
class SettingsViewController: UIViewController {
    
    var settingTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        
        tableView.layer.cornerRadius = 20
        tableView.allowsSelection = true
        tableView.register(SettingsTableView.self, forCellReuseIdentifier: Constants.Identifiers.SettingsTableView)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.dataSource = self
        settingTableView.delegate = self
        settingTableView.backgroundColor = UIColor(red: 0.788, green: 0.714, blue: 0.745, alpha: 1.0)
        setupViews()
        setupConstraints()
    }
    func setupViews(){
        view.addSubview(settingTableView)
    }
    func setupConstraints(){
        settingTableView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }

}
extension SettingsViewController: UITableViewDataSource{
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = SettingsTableView()
            return cell
            
        }
    
    }
extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Settings"
    }
    
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 80
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
            headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        }
    }
}
