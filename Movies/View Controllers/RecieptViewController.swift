//
//  RecieptViewController.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

class RecieptViewController: UIViewController {

    var movieBackgroundImageView: UIImageView!
    var recieptImageView: UIImageView!
    var backButton: UIButton!
    var paymentMadeBanner: UILabel!
    var movieImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1)

        setupMovieBackgroundImageView()
        setupBackButton()
        setupRecieptImageView()
        setupMovieImage()
        setupPaymentMadeBanner()
        
        setupConstraints()
    }
    
    func setupMovieBackgroundImageView() {
        movieBackgroundImageView = UIImageView(image: UIImage(named: "Group 4"))
        movieBackgroundImageView.layer.cornerRadius = 6
        
        view.addSubview(movieBackgroundImageView)
    }
    
    func setupBackButton() {
        backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        view.addSubview(backButton)
    }
    
    func setupRecieptImageView() {
        recieptImageView = UIImageView(image: UIImage(named: "Group 10"))
        
        view.addSubview(recieptImageView)
    }
    
    func setupMovieImage() {
        movieImageView = UIImageView(image: UIImage(named: "warcraft"))
        
        view.addSubview(movieImageView)
    }
    
    func setupPaymentMadeBanner() {
        paymentMadeBanner = UILabel()
        paymentMadeBanner.text = "Payment Made"
        paymentMadeBanner.backgroundColor = UIColor(red:0.24, green:0.23, blue:0.93, alpha:1)
        paymentMadeBanner.textAlignment = .center
        paymentMadeBanner.font = UIFont.systemFont(ofSize: 16)
        paymentMadeBanner.textColor = .white
        
        view.addSubview(paymentMadeBanner)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupConstraints() {
        
        movieBackgroundImageView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(48)
            make.height.width.equalTo(20)
        }
        
        recieptImageView.snp.makeConstraints { (make) in
            make.top.equalTo(backButton.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        movieImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(recieptImageView).offset(48)
            make.top.equalTo(recieptImageView).offset(48)
            make.width.equalTo(60)
            make.height.equalTo(70)
        }
        
        paymentMadeBanner.snp.makeConstraints { (make) in
            make.height.equalTo(64)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
