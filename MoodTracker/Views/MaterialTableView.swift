//
//  MaterialTableView.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 02.12.2022.
//

import UIKit

class MaterialTableView: UITableViewCell {
    
    lazy private var titles: [String] = ["Как правильно обращаться к людям", "Научитесь показывать эмоции", "Приглашаем на вебинар по самоанализу", "Про Усталость и вялость", "Все о самооценке", "Всегда улыбайтесь", "Колесо баланса в жизни"]
    lazy private var emojis: [String] = ["person.wave.2", "sun.max.fill", "sparkles", "tropicalstorm", "circle.grid.cross", "circlebadge.2.fill", "suit.club"]
    lazy private var materialTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.MaterialTableViewCell)
        return tableView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        materialTableView.dataSource = self
        materialTableView.delegate = self
        materialTableView.rowHeight = 120
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MaterialTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.MaterialTableViewCell, for: indexPath) as! MaterialTableViewCell
        cell.dayLabel.text = titles[indexPath.row]
        cell.dayLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        cell.dayImage.image = UIImage(systemName: emojis[indexPath.row])
        cell.dayLabel.numberOfLines = 0
        cell.dayLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        if (indexPath.row == 0) {
            contentView.backgroundColor = .black
        }
        else if (indexPath.row == 1) {
            contentView.backgroundColor = .blue
        }
    }
}
extension MaterialTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Читайте также"
    }
}
private extension MaterialTableView{
    private func setupViews(){
        contentView.addSubview(materialTableView)
    }
    private func setupConstraints(){
        materialTableView.snp.makeConstraints{make in
            make.height.equalTo(800)
            make.edges.equalToSuperview()
        }
    }
    
}

