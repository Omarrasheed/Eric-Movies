//
//  SelectSeatViewController.swift
//  Movies
//
//  Created by Omar Rasheed on 2/25/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

class SelectSeatViewController: UIViewController {
    
    var movieBackgroundImageView: UIImageView!
    var backButton: UIButton!
    var movieSelectionCard: MovieSelectionCard!
    var legendImageView: UIImageView!
    var seatSelectionImageView: UIImageView!
    var payoutCard: PayoutCard!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setupMovieBackgroundImageView()
        setupBackButton()
        setupMovieSelectionCard()
        setuplegendImageView()
        setupSeatSelectionImageView()
        setupPayoutCard()
        
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
    
    func setupMovieSelectionCard() {
        movieSelectionCard = MovieSelectionCard()
        
        view.addSubview(movieSelectionCard)
    }
    
    func setuplegendImageView() {
        legendImageView = UIImageView(image: UIImage(named: "Group 14"))
        
        view.addSubview(legendImageView)
    }
    
    func setupSeatSelectionImageView() {
        seatSelectionImageView = UIImageView(image: UIImage(named: "Group 18"))
        
        view.addSubview(seatSelectionImageView)
    }
    
    func setupPayoutCard() {
        payoutCard = PayoutCard()
        payoutCard.delegate = self
        
        view.addSubview(payoutCard)
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
        
        movieSelectionCard.snp.makeConstraints { (make) in
            make.top.equalTo(backButton.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(170)
        }
        
        legendImageView.snp.makeConstraints { (make) in
            make.top.equalTo(movieSelectionCard.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(10)
        }
        
        seatSelectionImageView.snp.makeConstraints { (make) in
            make.top.equalTo(legendImageView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(340)
        }
        
        payoutCard.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(seatSelectionImageView.snp.bottom).offset(38)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

extension SelectSeatViewController: PayoutDelgate {
    func nextButtonPressed() {
        let recieptVC = RecieptViewController()
        navigationController?.pushViewController(recieptVC, animated: true)
    }
}
