//
//  MovieSelectionCard.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

class MovieSelectionCard: UIView {
    
    var movieTitleLabel: UILabel!
    var dateLabel: UILabel!
    var timeLabel: UILabel!
    var locationLabel: UILabel!

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 60
        
        setupMovieTitleLabel()
        setupDateLabel()
        setupTimeLabel()
        setupLocationLabel()
    }
    
    func setupMovieTitleLabel() {
        movieTitleLabel = UILabel()
        movieTitleLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        movieTitleLabel.text = "Ant Man and The Wasp"
        movieTitleLabel.font = .systemFont(ofSize: 18)
        movieTitleLabel.sizeToFit()
        addSubview(movieTitleLabel)
    }
    
    func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.layer.cornerRadius = 10
        dateLabel.backgroundColor = UIColor.white
        dateLabel.layer.borderWidth = 1
        dateLabel.layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        dateLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        dateLabel.text = "FRIDAY, 12"
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.sizeToFit()
        dateLabel.textAlignment = .center
        
        addSubview(dateLabel)
    }
    
    func setupTimeLabel() {
        timeLabel = UILabel()
        timeLabel.layer.cornerRadius = 10
        timeLabel.backgroundColor = UIColor.white
        timeLabel.layer.borderWidth = 1
        timeLabel.layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        timeLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        timeLabel.text = "09:30 AM"
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.sizeToFit()
        timeLabel.textAlignment = .center
        
        addSubview(timeLabel)
    }
    
    func setupLocationLabel() {
        locationLabel = UILabel()
        locationLabel.layer.cornerRadius = 10
        locationLabel.backgroundColor = UIColor.white
        locationLabel.layer.borderWidth = 1
        locationLabel.layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        locationLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        locationLabel.text = "Sathyam Cinemas: Royapettah"
        locationLabel.font = UIFont.systemFont(ofSize: 10)
        locationLabel.sizeToFit()
        locationLabel.textAlignment = .center
        
        addSubview(locationLabel)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        movieTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(movieTitleLabel.intrinsicContentSize.height)
            make.width.equalTo(movieTitleLabel.intrinsicContentSize.width)
            make.top.equalToSuperview().inset(30)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(self.snp.centerX).offset(-7)
            make.height.equalTo(28)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel)
            make.leading.equalTo(self.snp.centerX).offset(7)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(28)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.height.equalTo(28)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
