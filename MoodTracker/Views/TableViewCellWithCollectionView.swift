//
//  TableViewCellWithCollectionView.swift
//  MoodTracker
//
//  Created by Aruzhan Zhakhan on 19.11.2022.
//

import UIKit
import SnapKit

class TableViewCellWithCollectionView: UITableViewCell, UITextFieldDelegate {
    lazy private var words: [String] = ["Super", "Good", "Nice", "Not Bad", "Not Good"]
    lazy private var emojis: [String] = ["face.smiling", "face.smiling.fill", "face.dashed", "face.dashed.fill", "faceid"]
    lazy private var moodCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.CollectionViewCell)
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        moodCollectionView.dataSource = self
        moodCollectionView.delegate = self
        moodCollectionView.backgroundColor = UIColor(red: 0.996, green: 0.918, blue: 0.980, alpha: 1.0)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
private extension TableViewCellWithCollectionView{
    private func setupViews(){
        contentView.addSubview(moodCollectionView)
    }
    private func setupConstraints(){
        moodCollectionView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
extension TableViewCellWithCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.CollectionViewCell, for: indexPath) as! CollectionViewCell
        cell.nameLabel.text = words[indexPath.row]
        cell.moodImage.image = UIImage(systemName: emojis[indexPath.row])
        return cell
    }
}
extension TableViewCellWithCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 75, height: 100)
    }
}
