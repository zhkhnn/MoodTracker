//
//  TextTableViewCell.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 10.12.2022.
//

import UIKit

class TextTableViewCell: UITableViewCell, UITextFieldDelegate {
    lazy private var textField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 200, height: 20))
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(textField)
    }
    func setupConstraints(){
        textField.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }

}
