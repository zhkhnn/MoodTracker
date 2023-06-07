//
//  MainPageTableViewHeaderFooterView.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 25.11.2022.
//

import UIKit
import SnapKit

class MainPageTableViewHeaderFooterView: UITableViewCell {
    
    lazy private var moodLabel: UILabel = {
        let label = UILabel()
        label.text = "Как вы себя чувствуете?"
        return label
    }()
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 10, y: 50, width: self.contentView.frame.width, height: 200)
        datePicker.timeZone = NSTimeZone.local
//        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    lazy private var timeTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    lazy var buttonChange: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        button.setTitle("Получи заряд", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
            
            // Create date formatter
            let dateFormatter: DateFormatter = DateFormatter()
            
            // Set date format
            dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
            
            // Apply date format
            let selectedDate: String = dateFormatter.string(from: sender.date)
            
            print("Selected value \(selectedDate)")
        }
    
}
private extension MainPageTableViewHeaderFooterView{
    func setupViews(){
        contentView.addSubview(moodLabel)
        contentView.addSubview(datePicker)
        contentView.addSubview(buttonChange)
    }
    func setupConstraints(){
        moodLabel.snp.makeConstraints{make in
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(datePicker.snp.top)
        }
        datePicker.snp.makeConstraints{make in
            make.top.equalTo(moodLabel.snp.bottom)
//            make.width.equalTo(160)
            make.bottom.equalTo(buttonChange.snp.top)
            make.width.equalTo(320)
        }
        buttonChange.snp.makeConstraints{make in
            make.top.equalTo(datePicker.snp.bottom).inset(20)
            make.center.equalTo(contentView.snp.center)
            make.width.equalTo(160)
        }
    }
}
