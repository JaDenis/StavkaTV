//
//  ForecastCell.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

struct ForecastItem {
    var id = 0
    var team1Icon = ""
    var team2Icon = ""
    var team1Name = ""
    var team2Name = ""
    var date = ""
    var time = ""
    var coefficient = 1.50
    var forecasterIcon = ""
    var forecasterName = ""
}

class ForecastCell: UITableViewCell {
    let screen = UIScreen.main.bounds
    
    var forecast: ForecastItem? { // property that applies data to view, after being set
        didSet {
            if let team1Icon = forecast?.team1Icon {
                if let image = UIImage(named: team1Icon) {
                    self.team1ImageView.image = image
                }
            }
            
            if let team2Icon = forecast?.team2Icon {
                if let image = UIImage(named: team2Icon) {
                    self.team2ImageView.image = image
                }
            }
            
            if let team1Name = forecast?.team1Name {
                self.team1NameLabel.text = team1Name
            }
            
            if let date = forecast?.date {
                self.dateLabel.text = date
            }
            
            if let time = forecast?.time {
                self.timeLabel.text = time
            }
            
            if let coeff = forecast?.coefficient {
                self.coeffLeftLabel.text = String(coeff)
            }
            
            if let forecasterIcon = forecast?.forecasterIcon {
                self.forecasterIcon.image = UIImage(named: forecasterIcon)!
            }
            
            if let forecasterName = forecast?.forecasterName {
                self.forecasterNameLabel.text = forecasterName
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .gray
        addSubview(bg)
        
        bg.addSubview(team1ImageView)
        bg.addSubview(team2ImageView)
        
        bg.addSubview(team1NameLabel)
        bg.addSubview(team2NameLabel)
        
        bg.addSubview(timeLabel)
        bg.addSubview(dateLabel)
        
        bg.addSubview(bodyContainer)
        
        bodyContainer.addSubview(bodyLabel)
        bodyContainer.addSubview(coeffLeftLabel)
        bodyContainer.addSubview(sportIconContainer)
        bodyContainer.addSubview(sportIcon)
        
        bg.addSubview(forecasterIcon)
        bg.addSubview(forecasterNameLabel)
        
        bg.addSubview(greenLabel)
        bg.addSubview(yellowLabel)
        bg.addSubview(redLabel)
    }
    
    override func prepareForReuse() {
        bg.alpha = 1.0
        
        team1ImageView.alpha = 1.0
        team2ImageView.alpha = 1.0
        
        team1NameLabel.alpha = 1.0
        team2NameLabel.alpha = 1.0
        
        timeLabel.alpha = 1.0
        dateLabel.alpha = 1.0
        
        bodyContainer.alpha = 1.0
        bodyLabel.alpha = 1.0
        coeffLeftLabel.alpha = 1.0
        sportIconContainer.alpha = 1.0
        sportIcon.alpha = 1.0
        
        forecasterIcon.alpha = 1.0
        forecasterNameLabel.alpha = 1.0
        
        greenLabel.alpha = 1.0
        yellowLabel.alpha = 1.0
        redLabel.alpha = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ////////////////////////////////
    //////////// Header ////////////
    ////////////////////////////////
    
    // SideMenu
    // Таб бар
    // 2 экрана
    
    // вставить SideMenu
    // захакать таб бар
    // экран с кнопкой
    // экран со статистикой
//
//    lazy var premiumButton
//
//    lazy var statusLabel
//
//    lazy var buttonBorderView
//    lazy var buttonView
//    lazy var buttonIconView
//    lazy var buttonTitleView
//
//    lazy var optimalLocationTitleLabel
//
//    lazy var optimalLocationView
//    lazy var markerImageView
//    lazy var locationLabel
//    lazy var franceFlagImageView
//
//    lazy var selectLocationLabel
//
//    lazy var locationButtonView
//    lazy var locationMarkerImageView
//    lazy var locationLabel
//    lazy var usFlagImageView
//
//    lazy var usFlagImageView
//    lazy var
//
//
//
//
//    lazy var hamsterView
//    lazy var hamsterImageView
//
//    lazy var countryLabel
//    lazy var timerLabel
//
//    lazy var optimalLocationView
//
//    lazy var statisticsView
//    lazy var downloadedIconBackgroundView
//    lazy var downloadedImageView
//    lazy var downloadedValueLabel
//    lazy var downloadedTitleLabel
//
//    lazy var uploadedIconBackgroundView
//    lazy var uploadedImageView
//    lazy var uploadedValueLabel
//    lazy var uploadedTitleLabel
//
//    lazy var ipAdressIconBackgroundView
//    lazy var ipAdressImageView
//    lazy var ipAdressValueLabel
//    lazy var ipAdressTitleLabel
//
//    lazy var avgSpeedIconBackgroundView
//    lazy var avgSpeedImageView
//    lazy var avgSpeedValueLabel
//    lazy var avgSpeedTitleLabel
//
//    lazy var connectedView
//    lazy var hamsterIconView
//    lazy var hamsterIconImageView
//    lazy var connectedLabel

    
    // 1) заверстать connectButton
    // 2) заверстать locationButton
    
    // 2.5) заверстать в таббаре подложку для активной кнопки и просто двигать ее потом
    
    
    
    // 3) заверстать хомячка
    // 4) вставить locationButton
    // 5) заверстать statisticsView
    // 6) заверстать connectedView
    
    // 7) импортнуть в проект SideMenu cocoapod
    // 8) заверстать злоебучий таббар
    // 9) злоебучий
    
    // 10)
    
    // 8) tiktok - видео анкета
    // 9) ideaBox как tiktok
    // 10)
    // 11)
    
   // очень компьютерный эффект у синтезатора в джаззе
    
    
//    
//    махатбара
//    lazy var
//                            
//                           76 55 148
//                            
//                            
//                            purple3 67 37 140
//                            black
//                            128 93 251
//                            71 40 146
//                            29 36 88
//                                4 5 14
//                            132 97 253
//                            211 208 253
//                            
//                            72 41 150
//                            128 93 250
//                            
//                            
//                            214 212 253
//                            254 253 254
//                            
//                            backgroundColor 28 34 84
//    
//    
//    
//                        
//    
    
    
    lazy var bg: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 8, y: 8, width: screen.width - 16, height: 250 - 16)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 20)
        return view
    }()
    
    lazy var team1ImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "teamIcon1")
        img.contentMode = .scaleAspectFit
        img.frame = CGRect(x: 8, y: 8, width: 46, height: 46)
        return img
    }()
    
    lazy var team2ImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "teamIcon1")
        img.contentMode = .scaleAspectFit
        img.frame = CGRect(x: 70, y: 8, width: 46, height: 46)
        return img
    }()
    
    lazy var team1NameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 112, y: 15, width: screen.width - 184, height: 16)
        label.text = "Манчестер..."
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var team2NameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 112, y: 34, width: screen.width - 124, height: 16)
        label.text = "ПСЖ"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: screen.width - 96, y: 13, width: 60, height: 16)
        label.text = "19:45"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .right
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: screen.width - 94, y: 34, width: 60, height: 16)
        label.text = "Завтра"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        label.alpha = 0.6
        label.textAlignment = .right
        return label
    }()
    
    ////////////////////////////////
    //////////// Body ////////////
    ////////////////////////////////
    lazy var bodyContainer: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 8, y: 68, width: screen.width - 32, height: 100)
        view.roundCorners([.allCorners], radius: 14)
        view.backgroundColor = .lightGray2
        return view
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 8, y: 8, width: screen.width - 64, height: 36)
        label.text = "В чемпионате Германии \"Штутгарт\" забирает меньше всех, но вряд ли подняться выше в тур..."
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var coeffLeftLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 8, y: 61, width: 60, height: 29)
        label.backgroundColor = .darkBlue
        label.text = "1.50"
        label.textColor = .white
        label.roundCorners([.allCorners], radius: 15)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var sportIconContainer: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width - 70, y: 63, width: 28, height: 28)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 15)
        return view
    }()
    
    lazy var sportIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "football")
        img.frame = CGRect(x: screen.width - 66, y: 67, width: 20, height: 20)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    
    ////////////////////////////////
    //////////// Footer ////////////
    ////////////////////////////////
    
    lazy var forecasterIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "forecasterIcon")
        img.frame = CGRect(x: 22, y: 178, width: 44, height: 44)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var forecasterNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 72, y: 178, width: screen.width - 242, height: 44)
        label.text = "Михаил\nПоленов"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: 2.0) // try values 1.0 to 5.0
        return label
    }()
    
    lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: screen.width - 146, y: 189, width: 34, height: 22)
        label.text = " + 6"
        label.textColor = .green
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        label.roundCorners([.allCorners], radius: 11)
        return label
    }()
    
    lazy var yellowLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: screen.width - 109, y: 189, width: 34, height: 22)
        label.text = "  = 2"
        label.textColor = .yellow
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        label.roundCorners([.allCorners], radius: 11)
        return label
    }()
    
    lazy var redLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: screen.width - 70, y: 189, width: 34, height: 22)
        label.text = "  - 1"
        label.textColor = .red
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        label.roundCorners([.allCorners], radius: 11)
        return label
    }()
}

