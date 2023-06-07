//
//  TableViewCell.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 02.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    lazy private var settingsNames: [String] = ["Edit profile", "Edit mood", "Alarm"]

    lazy  var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        contentView.layer.borderColor = UIColor.red.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TableViewCell{
    func setupViews(){
        contentView.backgroundColor = UIColor(red: 0.996, green: 0.918, blue: 0.980, alpha: 1.0)
        contentView.addSubview(dayLabel)
        
    }
    func setupConstraints(){
        dayLabel.snp.makeConstraints{make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

