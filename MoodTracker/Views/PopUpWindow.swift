//
//  PopUpWindow.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 10.12.2022.
//

import Foundation
import SnapKit
private class PopUpWindowView: UIView {
    let BorderWidth: CGFloat = 2.0
    lazy var popupView: UIView = {
        let popupView = UIView()
        popupView.backgroundColor = UIColor(red: 0.996, green: 0.918, blue: 0.980, alpha: 1.0)
        popupView.layer.borderWidth = BorderWidth
        popupView.layer.masksToBounds = true
        popupView.layer.borderColor = UIColor.white.cgColor
        return popupView
    }()
    lazy var popupTitle: UILabel = {
        let popupTitle = UILabel()
        popupTitle.textColor = UIColor.white
        popupTitle.backgroundColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
        popupTitle.layer.masksToBounds = true
        popupTitle.adjustsFontSizeToFitWidth = true
        popupTitle.clipsToBounds = true
        popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupTitle.numberOfLines = 1
        popupTitle.textAlignment = .center
        return popupTitle
    }()
    lazy var popupText: UILabel = {
        let popupText = UILabel()
        popupText.textColor = UIColor.black
        popupText.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        popupText.numberOfLines = 0
        popupText.textAlignment = .center
        return popupText
    }()
    lazy var popupButton: UIButton = {
        let popupButton = UIButton()
        popupButton.setTitleColor(UIColor.white, for: .normal)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupButton.backgroundColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
        return popupButton
    }()
    init() {
        super.init(frame: CGRect.zero)
        addSubview(popupView)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        popupView.addSubview(popupTitle)
        popupView.addSubview(popupText)
        popupView.addSubview(popupButton)
    }
    func setupConstraints(){
        popupView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        popupView.widthAnchor.constraint(equalToConstant: 293),
        popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
                
        popupTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        popupTitle.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
        popupTitle.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
        popupTitle.topAnchor.constraint(equalTo: popupView.topAnchor, constant: BorderWidth),
        popupTitle.heightAnchor.constraint(equalToConstant: 55)
        ])
                
                
        popupText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        popupText.heightAnchor.constraint(greaterThanOrEqualToConstant: 67),
        popupText.topAnchor.constraint(equalTo: popupTitle.bottomAnchor, constant: 8),
        popupText.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 15),
        popupText.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -15),
        popupText.bottomAnchor.constraint(equalTo: popupButton.topAnchor, constant: -8)
        ])

                
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        popupButton.heightAnchor.constraint(equalToConstant: 44),
        popupButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: BorderWidth),
        popupButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -BorderWidth),
        popupButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -BorderWidth)
        ])
    }
}

class PopUpWindow: UIViewController {
    private let popUpWindowView = PopUpWindowView()

    init(title: String, text: String, buttontext: String) {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
                
        popUpWindowView.popupTitle.text = title
        popUpWindowView.popupText.text = text
        popUpWindowView.popupButton.setTitle(buttontext, for: .normal)
        popUpWindowView.popupButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view = popUpWindowView
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
  
}
