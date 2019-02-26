//
//  DateOptionCollectionViewCell.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//  `

import UIKit

class DateOptionCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "DateOptionCell"
    var dayOfWeekLabel: UILabel!
    var dayOfMonthLabel: UILabel!
    
    var cellSelected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 9
        layer.borderWidth = 1
        layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        
        createdayOfWeekLabel()
        createDayOfMonthLabel()
    }
    
    func createdayOfWeekLabel() {
        dayOfWeekLabel = UILabel()
        dayOfWeekLabel.lineBreakMode = .byWordWrapping
        dayOfWeekLabel.numberOfLines = 0
        dayOfWeekLabel.textColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1)
        
        contentView.addSubview(dayOfWeekLabel)
    }
    
    func createDayOfMonthLabel() {
        dayOfMonthLabel = UILabel()
        dayOfMonthLabel.lineBreakMode = .byWordWrapping
        dayOfMonthLabel.numberOfLines = 0
        
        contentView.addSubview(dayOfMonthLabel)
    }
    
    func setDate(_ date: Date) {
        let dayOfMonthFormatter = DateFormatter()
        dayOfMonthFormatter.dateFormat = "dd"
        
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEE"
        
        let dayOfWeek = dayOfWeekFormatter.string(from: date)
        var textString = NSMutableAttributedString(string: dayOfWeek, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)
            ])
        var textRange = NSRange(location: 0, length: textString.length)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.2
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        textString.addAttribute(NSAttributedString.Key.kern, value: -0.5, range: textRange)
        dayOfWeekLabel.attributedText = textString
        dayOfWeekLabel.sizeToFit()
        
        let dayOfMonth = dayOfMonthFormatter.string(from: date)
        textString = NSMutableAttributedString(string: dayOfMonth, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
            ])
        textRange = NSRange(location: 0, length: textString.length)
        paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.17
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        dayOfMonthLabel.attributedText = textString
        dayOfMonthLabel.sizeToFit()
        
        dayOfMonthLabel.textColor = cellSelected ? UIColor(red:0.13, green:0.13, blue:0.14, alpha:1) : UIColor(red:0.77, green:0.79, blue:0.87, alpha:1)
        
        dayOfWeekLabel.textColor = cellSelected ? UIColor(red:0.13, green:0.13, blue:0.14, alpha:1) : UIColor(red:0.77, green:0.79, blue:0.87, alpha:1)
        
        setupConstraints()
    }
    
    func toggleColor() {
        if !cellSelected {
            dayOfWeekLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
            dayOfMonthLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
            layer.borderColor = UIColor(red:0.35, green:0.5, blue:0.93, alpha:1).cgColor
        } else {
            dayOfWeekLabel.textColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1)
            dayOfMonthLabel.textColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1)
            layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        }
        cellSelected.toggle()
    }
    
    func setupConstraints() {
        dayOfWeekLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(14)
            make.height.equalTo(dayOfWeekLabel.intrinsicContentSize.height)
        }
        
        dayOfMonthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dayOfWeekLabel.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(dayOfMonthLabel.intrinsicContentSize.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
