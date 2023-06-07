//
//  MaterialTableViewCell.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 02.12.2022.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {

    lazy  var dayLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    lazy var dayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "face.smiling")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension MaterialTableViewCell{
    func setupViews(){
        contentView.addSubview(dayLabel)
        contentView.addSubview(dayImage)
        contentView.backgroundColor = UIColor(red: 0.996, green: 0.918, blue: 0.980, alpha: 1.0)
        
    }
    
    func setupConstraints(){
//        dayImage.translatesAutoresizingMaskIntoConstraints = false
//        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.snp.makeConstraints{make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(80)
            make.leading.equalTo(dayImage.snp.trailing).offset(10)
        }
        dayImage.snp.makeConstraints{make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(60)
            make.width.equalTo(dayImage.snp.height)
        }
        
    }
    
}


