//
//  MovieDetailCard.swift
//  Movies
//
//  Created by Omar Rasheed on 2/23/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

class MovieDetailCard: UIView {
    
    var movieImageView: UIImageView!
    var movieTitleLabel: UILabel!
    var ratingsImageView: UIImageView!
    var lineSeparator: UIView!
    var synopsisLabel: UILabel!
    var synposisContentLabel: UILabel!
    var actionTag: UILabel!
    var adventureTag: UILabel!
    var expandImageView: UIImageView!

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 60
        
        setupMovieImage()
        setupMovieTitleLabel()
        setupRatingsImageView()
        setupLineSeparator()
        setupSynopsisLabel()
        setupActionTag()
        setupAdventureTag()
        setupSynopsisContentLabel()
        setupExpandImageView()
    }
    
    func setupMovieImage() {
        movieImageView = UIImageView(image: UIImage(named: "warcraft"))
        
        addSubview(movieImageView)
    }
    
    func setupMovieTitleLabel() {
        movieTitleLabel = UILabel()
        movieTitleLabel.text = "Ant Man and the Wasp"
        movieTitleLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        movieTitleLabel.font = UIFont.systemFont(ofSize: 18)
        
        addSubview(movieTitleLabel)
    }
    
    func setupRatingsImageView() {
        ratingsImageView = UIImageView(image: UIImage(named: "ratings"))
        
        addSubview(ratingsImageView)
    }
    
    func setupLineSeparator() {
        lineSeparator = UIView()
        lineSeparator.alpha = 0.3
        lineSeparator.layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        lineSeparator.layer.borderWidth = 1
        
        addSubview(lineSeparator)
    }
    
    func setupSynopsisLabel() {
        synopsisLabel = UILabel()
        synopsisLabel.text = "Synopsis"
        synopsisLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        synopsisLabel.font = UIFont.systemFont(ofSize: 13)
        
        addSubview(synopsisLabel)
    }
    
    func setupSynopsisContentLabel() {
        synposisContentLabel = UILabel()
        let textContent = "Scott Lang is grappling with the consequences of his choices as both a superhero and a father. Approached by Hope van Dyne and Dr. Hank Pym, Lang must once again don …"
        let textString = NSMutableAttributedString(string: textContent, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)
            ])
        let textRange = NSRange(location: 0, length: textString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        textString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: textRange)
        synposisContentLabel.attributedText = textString
        synposisContentLabel.lineBreakMode = .byWordWrapping
        synposisContentLabel.numberOfLines = 0
        synposisContentLabel.textColor = UIColor(red:0.53, green:0.56, blue:0.59, alpha:1)
        synposisContentLabel.sizeToFit()
        
        addSubview(synposisContentLabel)
    }
    
    func setupActionTag() {
        actionTag = UILabel()
        actionTag.layer.cornerRadius = 9
        actionTag.clipsToBounds = true
        actionTag.backgroundColor = UIColor(red:0.53, green:0.56, blue:0.59, alpha:0.1)
        actionTag.textColor = UIColor(red:0.53, green:0.56, blue:0.59, alpha:1)
        actionTag.text = "Action"
        actionTag.textAlignment = .center
        actionTag.font = UIFont.systemFont(ofSize: 10)
        
        addSubview(actionTag)
    }
    
    func setupAdventureTag() {
        adventureTag = UILabel()
        adventureTag.layer.cornerRadius = 9
        adventureTag.clipsToBounds = true
        adventureTag.backgroundColor = UIColor(red:0.53, green:0.56, blue:0.59, alpha:0.1)
        adventureTag.textColor = UIColor(red:0.53, green:0.56, blue:0.59, alpha:1)
        adventureTag.text = "Adventure"
        adventureTag.textAlignment = .center
        adventureTag.font = UIFont.systemFont(ofSize: 10)
        
        addSubview(adventureTag)
    }
    
    func setupExpandImageView() {
        expandImageView = UIImageView(image: UIImage(named: "Group 8"))
        
        addSubview(expandImageView)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        movieImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(60)
            make.height.equalTo(70)
        }
        
        movieTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(movieImageView.snp.trailing).offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(movieImageView).offset(12)
        }
        
        ratingsImageView.snp.makeConstraints { (make) in
            make.trailing.equalTo(movieTitleLabel)
            make.leading.equalTo(movieTitleLabel).offset(12)
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(10)
            make.height.equalTo(16)
        }
        
        lineSeparator.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(movieImageView.snp.bottom).offset(12)
            make.height.equalTo(2)
        }
        
        synopsisLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineSeparator.snp.bottom).offset(20)
            make.leading.equalTo(lineSeparator)
            make.width.equalTo(synopsisLabel.intrinsicContentSize.width)
            make.height.equalTo(synposisContentLabel.intrinsicContentSize.height + 4)
        }
        
        adventureTag.snp.makeConstraints { (make) in
            make.trailing.equalTo(lineSeparator)
            make.height.equalTo(adventureTag.intrinsicContentSize.height + 6)
            make.width.equalTo(adventureTag.intrinsicContentSize.width + 16)
            make.centerY.equalTo(synopsisLabel)
        }
        
        actionTag.snp.makeConstraints { (make) in
            make.trailing.equalTo(adventureTag.snp.leading).offset(-14)
            make.height.equalTo(actionTag.intrinsicContentSize.height + 6)
            make.width.equalTo(actionTag.intrinsicContentSize.width + 16)
            make.centerY.equalTo(synopsisLabel)
        }
        
        synposisContentLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(synopsisLabel)
            make.top.equalTo(synopsisLabel.snp.bottom)
            make.trailing.equalTo(lineSeparator)
            make.height.equalTo(80)
        }
        
        expandImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(synposisContentLabel.snp.bottom).offset(20)
            make.width.equalTo(170)
            make.height.equalTo(20)
        }
        
        snp.makeConstraints { (make) in
            make.bottom.equalTo(expandImageView).offset(16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
