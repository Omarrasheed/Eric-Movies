//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Omar Rasheed on 2/1/19.
//  Copyright © 2019 Omar Rasheed. All rights reserved.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {

    var movieBackgroundImageView: UIImageView!
    var backButton: UIButton!
    var detailCard: MovieDetailCard!
    var dateOptionsCollectionView: UICollectionView!
    var cinemaOptionsTableView: UITableView!
    var nextButtonImageView: UIImageView!
    
    var selectedCell: DateOptionCollectionViewCell?
    var selectedShowTime: ShowTimeCollectionViewCell?
    var dates: [Date] {
        let day = Calendar.current.component(.day, from: Date())
        let month = Calendar.current.component(.month, from: Date())
        
        let range = Calendar.current.range(of: .day, in: .month, for: Date())!
        let numDays = range.count
        
        var datesList = [Date]()
        for x in 0..<5 {
            var date = DateComponents()
            date.month = month + ((day + x) / numDays)
            date.day = (day + x) % numDays
            
            datesList.append((NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: date)!)!)
        }
        return datesList
    }
    
    var cinemas: [String] = ["Sathyam Cinemas: Royapettah", "Escape Cinemas", "Cineplex Movies", "Random Movies"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupMovieBackgroundImageView()
        setupBackButton()
        setupDetailCard()
        setupDateOptionsCollectionView()
        setupCinemaOptionsTableView()
        setupNextButtonImageView()
        
        setupConstraints()
    }
    
    func setupMovieBackgroundImageView() {
        movieBackgroundImageView = UIImageView(image: UIImage(named: "Group 3"))
        movieBackgroundImageView.layer.cornerRadius = 6
        
        view.addSubview(movieBackgroundImageView)
    }
    
    func setupBackButton() {
        backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        view.addSubview(backButton)
    }
    
    func setupDetailCard() {
        detailCard = MovieDetailCard()
        
        view.addSubview(detailCard)
    }
    
    func setupDateOptionsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        dateOptionsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        dateOptionsCollectionView.dataSource = self
        dateOptionsCollectionView.delegate = self
        dateOptionsCollectionView.register(DateOptionCollectionViewCell.self, forCellWithReuseIdentifier: DateOptionCollectionViewCell.reuseIdentifier)
        dateOptionsCollectionView.allowsMultipleSelection = true
        dateOptionsCollectionView.showsHorizontalScrollIndicator = false
        dateOptionsCollectionView.backgroundColor = .clear
        dateOptionsCollectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        
        view.addSubview(dateOptionsCollectionView)
    }
    
    func setupCinemaOptionsTableView() {
        cinemaOptionsTableView = UITableView(frame: .zero, style: .grouped)
        cinemaOptionsTableView.dataSource = self
        cinemaOptionsTableView.delegate = self
        cinemaOptionsTableView.register(CinemaOptionTableViewCell.self, forCellReuseIdentifier: CinemaOptionTableViewCell.reuseIdentifier)
        cinemaOptionsTableView.separatorStyle = .none
        cinemaOptionsTableView.contentInset = .init(top: -36, left: 0, bottom: -72, right: 0)
        cinemaOptionsTableView.backgroundColor = .clear
        
        view.addSubview(cinemaOptionsTableView)
    }
    
    func setupNextButtonImageView() {
        nextButtonImageView = UIImageView(image: UIImage(named: "Group 15"))
        nextButtonImageView.isUserInteractionEnabled = true
        
        let tapGestureRec = UITapGestureRecognizer()
        tapGestureRec.addTarget(self, action: #selector(nextButtonTapped))
        nextButtonImageView.addGestureRecognizer(tapGestureRec)
        
        view.addSubview(nextButtonImageView)
    }
    
    @objc func nextButtonTapped() {
        let seatSelectVC = SelectSeatViewController()
        navigationController?.pushViewController(seatSelectVC, animated: true)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupConstraints() {
        movieBackgroundImageView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(360)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(48)
            make.height.width.equalTo(20)
        }
        
        detailCard.snp.makeConstraints { (make) in
            make.top.equalTo(backButton.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        dateOptionsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(detailCard.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width/5-8)
        }
        
        cinemaOptionsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(dateOptionsCollectionView.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        nextButtonImageView.snp.makeConstraints { (make) in
            make.bottom.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(90)
        }
    }
}

extension MovieDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateOptionCollectionViewCell.reuseIdentifier, for: indexPath) as? DateOptionCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setDate(dates[indexPath.row])
        if indexPath == IndexPath(row: 0, section: 0) { cell.toggleColor(); cell.cellSelected = true; selectedCell = cell }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width/5-8, height: UIScreen.main.bounds.width/5-8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DateOptionCollectionViewCell else {return}
 
        if cell != selectedCell {
            cell.toggleColor()
            selectedCell?.toggleColor()
            selectedCell = cell
        }
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinemas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CinemaOptionTableViewCell.reuseIdentifier, for: indexPath) as? CinemaOptionTableViewCell else { return UITableViewCell() }
        
        cell.setCinema(cinemas[indexPath.row])
        cell.delegate = self
        if indexPath == IndexPath(row: 0, section: 0) {cell.first = true}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension MovieDetailViewController: ShowTimeDelegate {
    func showTimeChosen(cell: ShowTimeCollectionViewCell) {
        if cell != selectedShowTime {
            cell.toggleColor()
            selectedShowTime?.toggleColor()
            selectedShowTime = cell
        }
    }
    
    func setSelectedShowTime(cell: ShowTimeCollectionViewCell) {
        selectedShowTime = cell
    }
}
