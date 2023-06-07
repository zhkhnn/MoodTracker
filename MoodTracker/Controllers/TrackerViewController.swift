//
//  TrackerViewController.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 26.11.2022.
//

import UIKit
import SnapKit
class TrackerViewController: UIViewController {
    lazy private var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: CGRect.zero, style: .grouped)
        mainTableView.register(MainPageTableViewHeaderFooterView.self, forCellReuseIdentifier: Constants.Identifiers.MainPageTableViewHeaderFooterView)
        mainTableView.register(MaterialTableView.self, forCellReuseIdentifier: Constants.Identifiers.MaterialTableView)
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
    @objc func showpopupView(){
        var popUpWindow: PopUpWindow!
        popUpWindow = PopUpWindow(title: "Привет!", text: "Ты прекрасен! Улыбайся! Будь на волне с нами!", buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    func setupViews(){
        view.addSubview(mainTableView)
    }
    
    func setupConstraints(){
        mainTableView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }

    

}
extension TrackerViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0: let cell = MainPageTableViewHeaderFooterView()
            cell.backgroundColor = UIColor(red: 0.788, green: 0.714, blue: 0.745, alpha: 1.0)
            cell.buttonChange.addTarget(self, action: #selector(showpopupView), for: .touchUpInside)
            cell.isSelected = false
            return cell
        case 1: let cell = MaterialTableView()
            return cell
        default:
            return UITableViewCell()
            
        }
        
        
    }
}
extension TrackerViewController: UITableViewDelegate{
        
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 200
//        }
        
        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            
            if let headerView = view as? UITableViewHeaderFooterView {
                headerView.textLabel?.textColor = .white
            }
        }
    }
    
    

