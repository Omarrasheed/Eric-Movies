//
//  CinemaOptionTableViewCell.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

class CinemaOptionTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "cinemaCell"
    
    var cinemaTitleLabel: UILabel!
    var showTimesCollectionView: UICollectionView!
    var delegate: ShowTimeDelegate!
    var first = false
    
    var showTimes = ["09:30 AM", "12:30 PM", "03:30 PM", "08:40 PM"]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createCinemaTitleLabel()
        createShowTimesCollectionView()
    }
    
    func createCinemaTitleLabel() {
        cinemaTitleLabel = UILabel()
        cinemaTitleLabel.lineBreakMode = .byWordWrapping
        cinemaTitleLabel.numberOfLines = 0
        cinemaTitleLabel.textColor = UIColor(red:0.36, green:0.36, blue:0.36, alpha:1)
        contentView.addSubview(cinemaTitleLabel)
    }
    
    func createShowTimesCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        showTimesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        showTimesCollectionView.backgroundColor = .clear
        showTimesCollectionView.register(ShowTimeCollectionViewCell.self, forCellWithReuseIdentifier: ShowTimeCollectionViewCell.reuseIdentifier)
        showTimesCollectionView.delegate = self
        showTimesCollectionView.dataSource = self
        
        showTimesCollectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        
        contentView.addSubview(showTimesCollectionView)
    }
    
    func setCinema(_ cinema: String) {
        let textContent = cinema
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)
            ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.23
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        cinemaTitleLabel.attributedText = textString
        cinemaTitleLabel.sizeToFit()

        setupConstraints()
    }
    
    func setupConstraints() {
        cinemaTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview()
            make.width.equalTo(cinemaTitleLabel.intrinsicContentSize.width)
            make.height.equalTo(cinemaTitleLabel.intrinsicContentSize.height)
        }
        
        showTimesCollectionView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(cinemaTitleLabel.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CinemaOptionTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showTimes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowTimeCollectionViewCell.reuseIdentifier, for: indexPath) as? ShowTimeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setTime(showTimes[indexPath.row])
        
        if indexPath == IndexPath(item: 0, section: 0) && first {
            cell.toggleColor()
            delegate.setSelectedShowTime(cell: cell)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 82, height: 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ShowTimeCollectionViewCell else {return}
        delegate.showTimeChosen(cell: cell)
    }
}
