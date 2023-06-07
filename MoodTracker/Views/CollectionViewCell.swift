//
//  CollectionViewCell.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 19.11.2022.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    lazy private var dict:[String:[String]] = ["Совместные занятия":["Семья", "Друзья", "Свидание", "Вечеринка"],
        "Хобби": ["Кино и ТВ", "Чтение", "Игры", "Спорт", "Отдых"],
        "Сон":["Ложиться рано", "Хороший сон", "Средний сон", "Плохой Сон"],
        "Самосовершенствование": ["Медитировать", "Доброта", "Слушать", "Жертвовать", "Дарить подарок"],
                                               "Работа по дому": ["Покупки", "Уборка", "Приготовление пищи", "Стирка"],
                                               "Еда": ["Есть здоровую пищу", "Фаст-фуд", "Домашняя", "Ресторан", "Доставка", "Не есть мясо", "Ничего сладкого", "Никакой газировки"],
                                               "Романтические отношения": ["Цветы", "Поблагодарите", "Время вместе", "Массаж"],
                                               "Красота": ["Стрижка", "Оздоровление", "Массаж", "Маникюр", "Педикюр", "Уход за кожей", "СПА"],
                                               "Места": ["Дом", "Работа", "Школа", "Гости", "Путешествия", "Спортзал", "Кино", "Природа", "Отпуск"],
                                               "Погода": ["Солнечная", "Облака", "Дождь", "Снег", "Жара", "Буря", "Ветер"]
    ]
    
    lazy  var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Super"
        return label
    }()
 
    lazy var moodImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "face.smiling")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 0, green: 0.3569, blue: 0.1843, alpha: 1.0)
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(moodImage)
        
    }
    func setupConstraints(){
        nameLabel.snp.makeConstraints{make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.33)
            make.left.equalToSuperview().inset(10)
            make.centerY.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().offset(5)

        }
        moodImage.snp.makeConstraints{make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().offset(5)
            make.left.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.55)
        }
    }
}
