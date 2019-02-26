//
//  HomeViewController.swift
//  Movies
//
//  Created by Omar Rasheed on 1/30/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var navyBGLayer: UIView!
    var menuImageView: UIImageView!
    var shoppingCartImageView: UIImageView!
    var goToMovieButton: UIButton!
    var watchAtHomeButton: UIButton!
    var searchBar: UISearchBar!
    var selectedView: UIView!
    var optionsImageView: UIImageView!
    var locationImageView: UIImageView!
    var allMoviesLabel: UILabel!
    var viewAllButton: UIButton!
    var allMoviesImageView: UIImageView!
    
    var navyColor = UIColor(red:0.1, green:0.16, blue:0.23, alpha:1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createNavyBGLayer()
        setupMenuImageView()
        setupShoppingCartImageVIew()
        setupGoToMovieButton()
        setupWatchAtHomeButton()
        setupSelectedView()
        setupSearchBar()
        setupOptionsImageView()
        setupLocationImageView()
        setupAllMoviesLabel()
        setupViewAllButton()
        setupAllMoviesImageView()
        
        setupConstraints()
    }
    
    func createNavyBGLayer() {
        navyBGLayer = UIView()
        navyBGLayer.backgroundColor = navyColor
        
        view.addSubview(navyBGLayer)
    }
    
    func setupShoppingCartImageVIew() {
        shoppingCartImageView = UIImageView(image: UIImage(named: "cart"))
        
        view.addSubview(shoppingCartImageView)
    }
    
    func setupMenuImageView() {
        menuImageView = UIImageView(image: UIImage(named: "menu"))
        
        view.addSubview(menuImageView)
    }
    
    func setupGoToMovieButton() {
        goToMovieButton = UIButton()
        goToMovieButton.setTitle("Go to movie", for: .normal)
        goToMovieButton.backgroundColor = .clear
        goToMovieButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(goToMovieButton)
    }
    
    func setupWatchAtHomeButton() {
        watchAtHomeButton = UIButton()
        watchAtHomeButton.setTitle("Watch at home", for: .normal)
        watchAtHomeButton.backgroundColor = .clear
        watchAtHomeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        view.addSubview(watchAtHomeButton)
    }
    
    func setupSelectedView() {
        selectedView = UIView()
        selectedView.layer.cornerRadius = 2
        selectedView.backgroundColor = UIColor(red:1, green:0.89, blue:0.15, alpha:1)
        selectedView.layer.borderWidth = 2
        selectedView.layer.borderColor = UIColor(red:1, green:0.89, blue:0.15, alpha:1).cgColor
        
        view.addSubview(selectedView)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
        searchBar.placeholder = "What are you looking for?"
        
        let searchBarTextField = searchBar.value(forKey: "searchField") as? UITextField
        if let backgroundView = searchBarTextField?.subviews.first {
            backgroundView.layer.cornerRadius = 20
            backgroundView.clipsToBounds = true
        }
        
        view.addSubview(searchBar)
    }
    
    func setupOptionsImageView() {
        optionsImageView = UIImageView(image: UIImage(named: "Options"))
        optionsImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(selectMovie))
        optionsImageView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(optionsImageView)
    }
    
    func setupLocationImageView() {
        locationImageView = UIImageView(image: UIImage(named: "street"))
        
        view.addSubview(locationImageView)
    }
    
    func setupAllMoviesLabel() {
        allMoviesLabel = UILabel()
        allMoviesLabel.text = "All Movies"
        allMoviesLabel.font = UIFont.systemFont(ofSize: 18)
        
        view.addSubview(allMoviesLabel)
    }
    
    func setupViewAllButton() {
        viewAllButton = UIButton()
        viewAllButton.setTitleColor(UIColor(red:0.13, green:0.31, blue:0.84, alpha:1), for: .normal)
        viewAllButton.setTitle("View All", for: .normal)
        viewAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        view.addSubview(viewAllButton)
    }
    
    func setupAllMoviesImageView() {
        allMoviesImageView = UIImageView(image: UIImage(named: "All movies"))
        
        view.addSubview(allMoviesImageView)
    }
    
    @objc func selectMovie() {
        let movieDetailVC = MovieDetailViewController()
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    
    func setupConstraints() {
        
        menuImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(54)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(menuImageView.intrinsicContentSize.width)
            make.height.equalTo(menuImageView.intrinsicContentSize.height)
        }
        
        shoppingCartImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(menuImageView)
            make.trailing.equalToSuperview().inset(24)
            make.width.equalTo(shoppingCartImageView.intrinsicContentSize.width)
            make.height.equalTo(shoppingCartImageView.intrinsicContentSize.height)
        }
        
        goToMovieButton.snp.makeConstraints { (make) in
            make.leading.equalTo(menuImageView.snp.trailing).offset(30)
            make.centerY.equalTo(menuImageView)
            make.width.equalTo(goToMovieButton.intrinsicContentSize.width)
            make.height.equalTo(goToMovieButton.intrinsicContentSize.height)
        }
        
        watchAtHomeButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(shoppingCartImageView.snp.leading).offset(-30)
            make.centerY.equalTo(menuImageView)
            make.width.equalTo(watchAtHomeButton.intrinsicContentSize.width)
            make.height.equalTo(watchAtHomeButton.intrinsicContentSize.height)
        }
        
        selectedView.snp.makeConstraints { (make) in
            make.top.equalTo(goToMovieButton.snp.bottom).offset(4)
            make.leading.equalTo(goToMovieButton)
            make.width.equalTo(goToMovieButton.intrinsicContentSize.width)
            make.height.equalTo(4)
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(selectedView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        optionsImageView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(323)
        }
        
        locationImageView.snp.makeConstraints { (make) in
            make.top.equalTo(optionsImageView.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(100)
        }
        
        navyBGLayer.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(locationImageView.snp.centerY)
        }
        
        allMoviesLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(30)
            make.top.equalTo(locationImageView.snp.bottom).offset(-14)
            make.width.equalTo(allMoviesLabel.intrinsicContentSize.width)
            make.height.equalTo(allMoviesLabel.intrinsicContentSize.height)
        }
        
        viewAllButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(allMoviesLabel)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(viewAllButton.intrinsicContentSize.height)
            make.width.equalTo(viewAllButton.intrinsicContentSize.width)
        }
        
        allMoviesImageView.snp.makeConstraints { (make) in
            make.top.equalTo(allMoviesLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
