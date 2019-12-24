//
//  FeedVC.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    let screen = UIScreen.main.bounds
    let headerHeight: CGFloat = 94
    
    var items: [ForecastCell] = [ForecastCell(), ForecastCell(), ForecastCell(), ForecastCell(),
                                  ForecastCell(), ForecastCell(), ForecastCell(), ForecastCell()]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bg)
        setupTableView()
    }
    
    lazy var bg: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 14, width: screen.width, height: screen.height - 40)
        view.backgroundColor = .gray
        view.roundCorners([.allCorners], radius: 16)
        return view
    }()
    
    func setupTableView() {
        // : CollectionView Setup : //
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ForecastCell.self, forCellReuseIdentifier: "ForecastCell")
        tableView.register(SponsorCell.self, forCellReuseIdentifier: "SponsorCell")
        tableView.register(TurnOnNotificationCell.self, forCellReuseIdentifier: "TurnOnNotificationCell")
        tableView.register(ThatsAllCell.self, forCellReuseIdentifier: "ThatsAllCell")
        bg.addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.direction = .inPlaceFadeInTop
        tableView.isEnabled = true
        tableView.duration = 1.1
        tableView.delay = 0.06
        tableView.springDamping = 0.6
        tableView.springValocity = 1
    }
    
    lazy var tableView: TanibleView = {
        let frame = CGRect(x: 0, y: 0,
                           width: self.bounds.width,
                           height: self.bounds.height)
        let collectionView = TanibleView(frame: frame)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.estimatedRowHeight = 120
        return collectionView
    }()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "SponsorCell", for: indexPath) as! SponsorCell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastCell
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "TurnOnNotificationCell", for: indexPath) as! TurnOnNotificationCell
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastCell
        case 5:
            cell = tableView.dequeueReusableCell(withIdentifier: "SponsorCell", for: indexPath) as! SponsorCell
        case 6:
            cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastCell
        case 7:
            cell = tableView.dequeueReusableCell(withIdentifier: "ThatsAllCell", for: indexPath) as! ThatsAllCell
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 || indexPath.row == 5 {
            return 174
        }
        
        if indexPath.row == 3 {
            return 130
        }
        
        if indexPath.row == 7 {
            return 350
        }

        return 250
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
