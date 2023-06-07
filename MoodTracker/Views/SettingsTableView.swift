//
//  SettingsTableView.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 02.12.2022.
//

import UIKit

class SettingsTableView: UITableViewCell {
    
    lazy private var settingsNames: [String] = ["Edit profile", "Edit mood of the day", "Change theme", "Set alarm", "Awards", "Goals", "Tell your friends"]

    var selectedIndex = IndexPath(row:-1, section: 0)
    lazy private var cellTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.TableViewCell)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton()
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        cellTableView.dataSource = self
        cellTableView.delegate = self
        cellTableView.rowHeight = 100
        cellTableView.allowsSelection = true
        cellTableView.isUserInteractionEnabled = true
        self.layer.borderColor = UIColor.orange.cgColor
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
extension SettingsTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.TableViewCell, for: indexPath) as! TableViewCell
        myButton.tag = indexPath.row
        cell.dayLabel.text = settingsNames[indexPath.row]
        cell.dayLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        cell.dayLabel.numberOfLines = 0
        cell.dayLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.backgroundColor = .clear
        if selectedIndex == indexPath { cell.backgroundColor = UIColor.black }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath as IndexPath) else { return }
        if (indexPath as IndexPath == selectedIndex) {
            cell.contentView.backgroundColor = .red
        }
        else if (indexPath.row == 1) {
            cell.backgroundColor = .black
        }
    }
    
}
extension SettingsTableView: UITableViewDelegate{
    
}
private extension SettingsTableView{
    private func setupViews(){
        contentView.addSubview(cellTableView)
    }
    private func setupConstraints(){
        
        cellTableView.snp.makeConstraints{make in
            
            make.edges.equalToSuperview().inset(10)
        }
    }
    
}
