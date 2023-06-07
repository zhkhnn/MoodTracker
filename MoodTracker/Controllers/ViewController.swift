//
//  ViewController.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 18.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    lazy private var sectionNames: [String] = ["Совместные занятия", "Хобби", "Сон", "Самосовершенствование", "Работа по дому", "Еда", "Романтические отношения", "Красота", "Места", "Погода", "Краткое примечание", "Фото"]
    
    lazy private var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: CGRect.zero, style: .grouped)
//        mainTableView.register(MainPageTableViewHeaderFooterView.self, forCellReuseIdentifier: Constants.Identifiers.MainPageTableViewHeaderFooterView)
        mainTableView.register(TableViewCellWithCollectionView.self, forCellReuseIdentifier: Constants.Identifiers.CollectionViewCell)
        mainTableView.register(TextTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.TextTableViewCell)
        return mainTableView
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        mainTableView.backgroundColor = UIColor(red: 0.788, green: 0.714, blue: 0.745, alpha: 1.0)
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    func setupViews(){
        view.addSubview(mainTableView)
    }
    
    func setupConstraints(){
        mainTableView.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }


}
extension ViewController: UITableViewDataSource{
        func numberOfSections(in tableView: UITableView) -> Int {
            return 11
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if(indexPath.section==10){
                let cell = TextTableViewCell()
                return cell
            }else{
                let cell = TableViewCellWithCollectionView()
                return cell
            }
            
//            switch indexPath.section{
//            case 0..<13: let cell = TableViewCellWithCollectionView()
//                return cell
//            case 13: let cell = MainPageTableViewHeaderFooterView()
//                return cell
//            default:
//                return UITableViewCell()
//        }
            
        }
    
        
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .black
        }
    }
}

