//
//  ShowTimeCollectionViewCell.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

protocol ShowTimeDelegate {
    func setSelectedShowTime(cell: ShowTimeCollectionViewCell)
    func showTimeChosen(cell: ShowTimeCollectionViewCell)
}

class ShowTimeCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "showTimeCell"
    
    var timeLabel: UILabel!
    var cellSelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        
        setupTimelabel()
    }
    
    func setupTimelabel() {
        timeLabel = UILabel()
        timeLabel.lineBreakMode = .byWordWrapping
        timeLabel.numberOfLines = 0
        timeLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
    
        contentView.addSubview(timeLabel)
    }
    
    func setTime(_ time: String) {
        let textContent = time
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)
            ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.2
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        textString.addAttribute(NSAttributedString.Key.kern, value: -0.5, range: textRange)
        timeLabel.attributedText = textString
        timeLabel.sizeToFit()
        
        setupConstraints()
    }
    
    func toggleColor() {
        if !cellSelected {
            layer.borderColor = UIColor(red:0.35, green:0.5, blue:0.93, alpha:1).cgColor
        } else {
            layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        }
        cellSelected.toggle()
    }
    
    func setupConstraints() {
        timeLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(timeLabel.intrinsicContentSize.width)
            make.height.equalTo(timeLabel.intrinsicContentSize.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
