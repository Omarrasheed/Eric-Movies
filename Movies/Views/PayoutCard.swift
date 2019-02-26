//
//  PayoutCard.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

protocol PayoutDelgate {
    func nextButtonPressed()
}

class PayoutCard: UIView {
    
    var ticketCountImageView: UIImageView!
    var verticalLineSeparator: UIView!
    var totalPaymentLabel: UILabel!
    var cashAmountLabel: UILabel!
    var nextButtonImageView: UIImageView!
    var delegate: PayoutDelgate!
    
    init() {
        super.init(frame: .zero)
        
        layer.cornerRadius = 30
        backgroundColor = UIColor.white
        layer.borderWidth = 1
        layer.borderColor = UIColor(red:0.94, green:0.94, blue:0.95, alpha:1).cgColor
        
        createTicketCountImageView()
        createVerticalLineSeparator()
        createTotalPaymentLabel()
        createCashAmountLabel()
        createNextButtonImageView()
    }
    
    func createTicketCountImageView() {
        ticketCountImageView = UIImageView(image: UIImage(named: "Group 17"))
        
        addSubview(ticketCountImageView)
    }
    
    func createVerticalLineSeparator() {
        verticalLineSeparator = UIView()
        verticalLineSeparator.alpha = 0.40
        verticalLineSeparator.layer.borderWidth = 1
        verticalLineSeparator.layer.borderColor = UIColor(red:0.77, green:0.79, blue:0.87, alpha:1).cgColor
        
        addSubview(verticalLineSeparator)
    }
    
    func createTotalPaymentLabel() {
        totalPaymentLabel = UILabel()
        totalPaymentLabel.numberOfLines = 0
        totalPaymentLabel.textColor = UIColor(red:0.37, green:0.39, blue:0.42, alpha:1)
        totalPaymentLabel.textAlignment = .right
        totalPaymentLabel.text = "TOTAL PAYABLE:"
        totalPaymentLabel.font = UIFont.systemFont(ofSize: 10)
        totalPaymentLabel.sizeToFit()
        
        addSubview(totalPaymentLabel)
    }
    
    func createCashAmountLabel() {
        cashAmountLabel = UILabel()
        cashAmountLabel.numberOfLines = 0
        cashAmountLabel.textColor = UIColor(red:0.13, green:0.13, blue:0.14, alpha:1)
        cashAmountLabel.text = "$25"
        cashAmountLabel.font = UIFont.systemFont(ofSize: 22)
        cashAmountLabel.sizeToFit()
        
        addSubview(cashAmountLabel)
    }
    
    func createNextButtonImageView() {
        nextButtonImageView = UIImageView(image: UIImage(named: "Group 15"))
        nextButtonImageView.isUserInteractionEnabled = true
        
        let tapGestureRec = UITapGestureRecognizer()
        tapGestureRec.addTarget(self, action: #selector(nextButtonTapped))
        nextButtonImageView.addGestureRecognizer(tapGestureRec)
        
        addSubview(nextButtonImageView)
    }
    
    @objc func nextButtonTapped() {
        delegate.nextButtonPressed()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        ticketCountImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(32)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(48)
        }
        
        verticalLineSeparator.snp.makeConstraints { (make) in
            make.leading.equalTo(ticketCountImageView.snp.trailing).offset(30)
            make.top.bottom.equalToSuperview().inset(15)
            make.width.equalTo(1)
        }
        
        totalPaymentLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(verticalLineSeparator.snp.trailing).offset(30)
            make.centerY.equalToSuperview()
            make.width.equalTo(48)
            make.height.equalTo(26)
        }
        
        cashAmountLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(totalPaymentLabel.snp.trailing).offset(6)
            make.centerY.equalToSuperview()
            make.height.equalTo(cashAmountLabel.intrinsicContentSize.height)
            make.width.equalTo(cashAmountLabel.intrinsicContentSize.width)
        }
        
        nextButtonImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(-6)
            make.bottom.equalToSuperview().offset(16)
            make.width.equalTo(80)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
