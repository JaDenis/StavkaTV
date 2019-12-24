//
//  TabBarController.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//


import UIKit

    //-по молодости мы играли в эту игру, я вел здоровый образ жизни - обливался холодным пивом- лол
    //
    //игра с реальной графикой, где ебашут запускают ракету, которая выходит на орбиту и можно притянуть ее к одному из полюсов - юг или север
    //показывают мировую войну, ебашут планетарные турели по любой точке планеты
    //после импакта народ сидит в огромном типа концертном зале с большой разницей по высоте между сидениями
    //паника просто пиздец, никто ниче не понимает
    //можно стрелять "глазами"
    //
    //враги начинают телепортироваться в наш зал
    //мы стреляем как можем - но среди нас есть например группа из семи девочек, которые вообще не врубаются и смотрят в потолок
    //я говорю китайцу - я понял, выигрывает та сторона, на которой больше игроков в видеоигры
    //китаец задумался, улыбнулся, потом сделал грустную гримасу и кивнул




class TabBarController: UITabBarController {
    let screen = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgGradientView)
        
        
        
        
        
        view.addSubview(tab3View)
        tab3View.addSubview(buttonBorderView)
        tab3View.addSubview(buttonView)
        
        buttonView.addSubview(buttonIconView)
        buttonView.addSubview(buttonTitleView)
        
        tab3View.addSubview(optimalLocationTitleLabel)
        
        tab3View.addSubview(optimalLocationView)
        optimalLocationView.addSubview(markerImageView)
        optimalLocationView.addSubview(locationLabel)
        optimalLocationView.addSubview(franceFlagImageView)
        
        tab3View.addSubview(selectLocationLabel)
        
        tab3View.addSubview(locationButtonView)
        locationButtonView.addSubview(locationMarkerImageView)
        locationButtonView.addSubview(locationLabel2)
        locationButtonView.addSubview(usFlagImageView)
        
        
        
        view.addSubview(tab2View)
        tab2View.alpha = 0.0
        
        tab2View.addSubview(optimalLocationView2)
        optimalLocationView2.addSubview(markerImageView2)
        optimalLocationView2.addSubview(locationLabel3)
        optimalLocationView2.addSubview(franceFlagImageView2)
        
        tab2View.addSubview(statisticsView)
        statisticsView.addSubview(downloadedIconBackgroundView)
        downloadedIconBackgroundView.addSubview(downloadedImageView)
        statisticsView.addSubview(downloadedValueLabel)
        statisticsView.addSubview(downloadedTitleLabel)
        
        statisticsView.addSubview(uploadedIconBackgroundView)
        uploadedIconBackgroundView.addSubview(uploadedImageView)
        statisticsView.addSubview(uploadedValueLabel)
        statisticsView.addSubview(uploadedTitleLabel)
        
        statisticsView.addSubview(ipAdressIconBackgroundView)
        ipAdressIconBackgroundView.addSubview(ipAdressImageView)
        statisticsView.addSubview(ipAdressValueLabel)
        statisticsView.addSubview(ipAdressTitleLabel)
        
        statisticsView.addSubview(avgSpeedIconBackgroundView)
        avgSpeedIconBackgroundView.addSubview(avgSpeedImageView)
        statisticsView.addSubview(avgSpeedValueLabel)
        statisticsView.addSubview(avgSpeedTitleLabel)
        
        
        //    lazy var avgSpeedIconBackgroundView
        //    lazy var avgSpeedImageView
        //    lazy var avgSpeedValueLabel
        //    lazy var avgSpeedTitleLabel
        
        
        tab2View.addSubview(connectedView)
        connectedView.addSubview(hamsterIconView)
        hamsterIconView.addSubview(hamsterIconImageView)
        connectedView.addSubview(connectedLabel)
        
        view.addSubview(tabBarView)
        
        tabBarView.addSubview(tabIcon1)
        tabBarView.addSubview(tabIcon2)
        tabBarView.addSubview(tabIcon3)
        tabIcon3.alpha = 0.0
        
        tabBarView.addSubview(activeTabBg)
        
        tabBarView.addSubview(activeTabBgLeftSideCorner)
        tabBarView.addSubview(activeTabBgLeftSide)
        
        tabBarView.addSubview(activeTabBgRightSideCorner)
        tabBarView.addSubview(activeTabBgRightSide)
        
        tabBarView.addSubview(activeTabView)
        
        activeTabView.addSubview(activeTabIcon)
        
        tabBarView.addSubview(tabButton1)
        tabBarView.addSubview(tabButton2)
        tabBarView.addSubview(tabButton3)
        
        
        
        
        
        
        
        
        
        tab2Tapped()
        
    }
    
   
    
    //==================================================//
    //===================== Tab 2 ======================//
    //==================================================//
    
    lazy var tab2View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: screen.width, height: screen.height - 54)
        return view
    }()
    
    
    //    lazy var hamsterView
    //    lazy var hamsterImageView
    //
    //    lazy var countryLabel
    //    lazy var timerLabel
    //
    
    lazy var optimalLocationView2: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20,
                            y: 128,
                            width: screen.width - 40, height: 56)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 18)
        return view
    }()
    
    lazy var markerImageView2: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 28, y: 18, width: 20, height: 20)
        img.image = UIImage(named: "marker")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var locationLabel3: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 62, y: 18, width: 140, height: 20)
        label.text = "France - Paris"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    
    lazy var franceFlagImageView2: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: optimalLocationView.frame.width - 56, y: 14, width: 28, height: 28)
        img.image = UIImage(named: "flag")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var statisticsView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 226, width: screen.width - 40, height: 176)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 22)
        return view
    }()
    
    lazy var downloadedIconBackgroundView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 26, width: 28, height: 25)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.allCorners], radius: 5)
        return view
    }()
    
    lazy var downloadedImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 6, y: 4, width: 16, height: 16)
        img.image = UIImage(named: "downloaded")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var downloadedValueLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 64, y: 28, width: 140, height: 20)
        label.text = "224,34 Mb"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    
    lazy var downloadedTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: statisticsView.frame.width - 90, y: 28, width: 74, height: 20)
        label.text = "Downloaded"
        label.font = .systemFont(ofSize: 11)
        label.textColor = .black
        label.alpha = 0.63
        label.textAlignment = .right
        return label
    }()
    
   //
    //
    //
    
    var statisticsYStep: CGFloat = 34.0
    
    lazy var uploadedIconBackgroundView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 26 + statisticsYStep, width: 28, height: 25)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.allCorners], radius: 5)
        return view
    }()
    
    lazy var uploadedImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 6, y: 4, width: 16, height: 16)
        img.image = UIImage(named: "uploaded")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var uploadedValueLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 64, y: 28 + statisticsYStep, width: 140, height: 20)
        label.text = "46,87 Mb"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    
    lazy var uploadedTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: statisticsView.frame.width - 90, y: 28 + statisticsYStep, width: 74, height: 20)
        label.text = "Uploaded"
        label.font = .systemFont(ofSize: 11)
        label.textColor = .black
        label.alpha = 0.63
        label.textAlignment = .right
        return label
    }()
    
    //    lazy var ipAdressIconBackgroundView
    //    lazy var ipAdressImageView
    //    lazy var ipAdressValueLabel
    //    lazy var ipAdressTitleLabel
    //
    
    
    lazy var ipAdressIconBackgroundView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 26 + 2 * statisticsYStep, width: 28, height: 25)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.allCorners], radius: 5)
        return view
    }()
    
    lazy var ipAdressImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 6, y: 5, width: 16, height: 16)
        img.image = UIImage(named: "ipaddress")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var ipAdressValueLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 64, y: 28 + 2 * statisticsYStep, width: 140, height: 20)
        label.text = "46.98.226.198"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    
    lazy var ipAdressTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: statisticsView.frame.width - 90, y: 28 + 2 * statisticsYStep, width: 74, height: 20)
        label.text = "IP address"
        label.font = .systemFont(ofSize: 11)
        label.textColor = .black
        label.alpha = 0.63
        label.textAlignment = .right
        return label
    }()
    
    //    lazy var avgSpeedIconBackgroundView
    //    lazy var avgSpeedImageView
    //    lazy var avgSpeedValueLabel
    //    lazy var avgSpeedTitleLabel
    
    
    lazy var avgSpeedIconBackgroundView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 26 + 3 * statisticsYStep, width: 28, height: 25)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.allCorners], radius: 5)
        return view
    }()
    
    lazy var avgSpeedImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 6, y: 5, width: 16, height: 16)
        img.image = UIImage(named: "avgspeed")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var avgSpeedValueLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 64, y: 28 + 3 * statisticsYStep, width: 140, height: 20)
        label.text = "8.32 Mbps"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    
    lazy var avgSpeedTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: statisticsView.frame.width - 90, y: 28 + 3 * statisticsYStep, width: 74, height: 20)
        label.text = "Avg speed"
        label.font = .systemFont(ofSize: 11)
        label.textColor = .black
        label.alpha = 0.63
        label.textAlignment = .right
        return label
    }()
    
    
    
    
    lazy var connectedView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 432, width: screen.width - 40, height: 56)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 18)
        return view
    }()
    
    lazy var hamsterIconView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 16, width: 28, height: 25)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.allCorners], radius: 5)
        return view
    }()
    
    lazy var hamsterIconImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 6, y: 5, width: 16, height: 16)
        img.image = UIImage(named: "hamster")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var connectedLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 57, y: 17, width: 220, height: 20)
        label.text = "Connected to Secure Server"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    


    
    
    
    
    
    
    
    
    //==================================================//
    //===================== Tab 3 ======================//
    //==================================================//
    
    lazy var tab3View: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: screen.width, height: screen.height - 54)
        //        view.backgroundColor = .green
        return view
    }()
    
    //    lazy var premiumButton
    //
    //    lazy var statusLabel
    
    lazy var buttonBorderView: GradientView = {
        let v = GradientView(frame: CGRect(x: screen.width / 2 - 100, y: 60, width: 200, height: 200))
        v.colors = [UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0),
                    UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)]
        v.locations = [0.0, 1.0]
        v.direction = .vertical
        v.roundCorners([.allCorners], radius: 100)
        return v
    }()
    
    lazy var buttonView: GradientView = {
        let v = GradientView(frame: CGRect(x: screen.width / 2 - 79, y: 82, width: 158, height: 158))
        v.colors = [UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0),
                    UIColor(red: 7/255, green: 7/255, blue: 20/255, alpha: 1.0)]
        v.locations = [0.0, 1.0]
        v.direction = .vertical
        v.roundCorners([.allCorners], radius: 80)
        return v
    }()
    
    lazy var buttonIconView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 60, y: 46, width: 38, height: 38)
        img.image = UIImage(named: "btn1")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var buttonTitleView: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 58, y: 99, width: 42, height: 12)
        label.text = "START"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var optimalLocationTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0,
                             y: buttonBorderView.frame.origin.y + buttonBorderView.frame.height + 35,
                             width: screen.width, height: 14)
        label.text = "Optimal location"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var optimalLocationView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20,
                            y: buttonBorderView.frame.origin.y + buttonBorderView.frame.height + 66,
                            width: screen.width - 40, height: 56)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 18)
        return view
    }()
    
    lazy var markerImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 28, y: 18, width: 20, height: 20)
        img.image = UIImage(named: "marker")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 62, y: 18, width: 140, height: 20)
        label.text = "France - Paris"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        return label
    }()
    
    lazy var franceFlagImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: optimalLocationView.frame.width - 56, y: 14, width: 28, height: 28)
        img.image = UIImage(named: "flag")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var selectLocationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0,
                             y: optimalLocationView.frame.origin.y + optimalLocationView.frame.height + 17,
                             width: screen.width, height: 14)
        label.text = "Or select location"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var locationButtonView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 20,
                            y: optimalLocationView.frame.origin.y + optimalLocationView.frame.height + 50,
                            width: screen.width - 40, height: 56)
        view.backgroundColor = UIColor(red: 71/255, green: 39/255, blue: 146/255, alpha: 1.0)
        view.roundCorners([.allCorners], radius: 18)
        return view
    }()
    
    lazy var locationMarkerImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 28, y: 18, width: 20, height: 20)
        img.image = UIImage(named: "marker")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var locationLabel2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 64, y: 18, width: 140, height: 20)
        label.text = "United States"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    lazy var usFlagImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: optimalLocationView.frame.width - 56, y: 14, width: 28, height: 28)
        img.image = UIImage(named: "usFlag")
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    
    lazy var bgGradientView: GradientView = {
        let v = GradientView(frame: CGRect(x: 0, y: 0, width: self.screen.width, height: self.screen.height))
        v.colors = [UIColor(red: 29/255, green: 36/255, blue: 88/255, alpha: 1.0), UIColor(red: 4/255, green: 5/255, blue: 14/255, alpha: 1.0)]
        v.locations = [0.0, 1.0]
        v.direction = .vertical
        return v
    }()
    
    lazy var tabBarView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: screen.height - 54, width: screen.width, height: 54)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        return view
    }()
    
    //==================================================//
    //=================== Tab Icons ====================//
    //==================================================//
    
    lazy var tabIcon1: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 46, y: 14, width: 24, height: 24)
        img.image = UIImage(named: "filters")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var tabIcon2: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: screen.width / 2 - 7, y: 18, width: 14, height: 14)
        img.image = UIImage(named: "hamster")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var tabIcon3: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: screen.width - 55, y: 13, width: 24, height: 24)
        img.image = UIImage(named: "www")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    //==================================================//
    //================ Active Tab View =================//
    //==================================================//
    
    lazy var activeTabView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width - 62, y: -18, width: 58, height: 50)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 12)
        return view
    }()
    
    lazy var activeTabIcon: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 15, y: 10, width: 29, height: 29)
        img.image = UIImage(named: "www")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var activeTabBg: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width - 70, y: 0, width: 72, height: 38)
        view.backgroundColor = UIColor(red: 4/255, green: 5/255, blue: 14/255, alpha: 1.0)
        view.roundCorners([.bottomLeft], radius: 10)
        return view
    }()
    
    lazy var activeTabBgLeftSide: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width - 90, y: 0, width: 20, height: 38)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.topRight], radius: 14)
        return view
    }()
    
    lazy var activeTabBgLeftSideCorner: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width - 86, y: 0, width: 16, height: 38)
        view.backgroundColor = UIColor(red: 4/255, green: 5/255, blue: 14/255, alpha: 1.0)
        return view
    }()
    
    lazy var activeTabBgRightSide: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width, y: 0, width: 20, height: 38)
        view.backgroundColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        view.roundCorners([.topLeft], radius: 14)
        return view
    }()
    
    lazy var activeTabBgRightSideCorner: UIView = {
        let view = UIView()
        view.frame = CGRect(x: screen.width, y: 0, width: 16, height: 38)
        view.backgroundColor = UIColor(red: 4/255, green: 5/255, blue: 14/255, alpha: 1.0)
        return view
    }()
    
    //==================================================//
    //================== Tab Button 1 ==================//
    //==================================================//
    
    lazy var tabButton1: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(tab1Tapped), for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: screen.width / 3, height: 54)
        return btn
    }()
    
    @objc func tab1Tapped() {
        tabIcon1.alpha = 0.0
        tabIcon2.alpha = 1.0
        tabIcon3.alpha = 1.0
        
        
        activeTabBg.frame = CGRect(x: 0, y: 0, width: 72, height: 38)
        activeTabBg.roundCorners([.bottomRight], radius: 10)
        
        activeTabView.frame = CGRect(x: 6, y: -18, width: 58, height: 50)
        
        activeTabBgLeftSideCorner.frame = CGRect(x: -16, y: 0, width: 16, height: 38)
        activeTabBgLeftSide.frame = CGRect(x: -20, y: 0, width: 20, height: 38)
        
        activeTabBgRightSideCorner.frame = CGRect(x: 72, y: 0, width: 16, height: 38)
        activeTabBgRightSide.frame = CGRect(x: 72, y: 0, width: 20, height: 38)
        
        activeTabIcon.image = UIImage(named: "filters")?.withRenderingMode(.alwaysTemplate)
        activeTabIcon.tintColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        activeTabIcon.frame = CGRect(x: 18, y: 14, width: 24, height: 24)
        
    }
    
    //==================================================//
    //================== Tab Button 2 ==================//
    //==================================================//
    
    lazy var tabButton2: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(tab2Tapped), for: .touchUpInside)
        btn.frame = CGRect(x: screen.width / 3, y: 0, width: screen.width / 3, height: 54)
        return btn
    }()
    
    @objc func tab2Tapped() {
        tabIcon1.alpha = 1.0
        tabIcon2.alpha = 0.0
        tabIcon3.alpha = 1.0
        
        tab2View.alpha = 1.0
        tab3View.alpha = 0.0
        
        
        activeTabBg.frame = CGRect(x: screen.width / 2 - 36, y: 0, width: 72, height: 38)
        activeTabBg.roundCorners([.bottomLeft, .bottomRight], radius: 10)
        
        activeTabView.frame = CGRect(x: screen.width / 2 - 29 , y: -18, width: 58, height: 50)
        
        activeTabBgLeftSideCorner.frame = CGRect(x: screen.width / 2 - 52, y: 0, width: 16, height: 38)
        activeTabBgLeftSide.frame = CGRect(x: screen.width / 2 - 56, y: 0, width: 20, height: 38)
        
        activeTabBgRightSideCorner.frame = CGRect(x: screen.width / 2 + 36, y: 0, width: 16, height: 38)
        activeTabBgRightSide.frame = CGRect(x: screen.width / 2 + 36, y: 0, width: 20, height: 38)

        activeTabIcon.image = UIImage(named: "hamster")?.withRenderingMode(.alwaysTemplate)
        activeTabIcon.tintColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        activeTabIcon.frame = CGRect(x: 23, y: 18, width: 14, height: 14)
    }
    
    //==================================================//
    //================== Tab Button 3 ==================//
    //==================================================//
    
    lazy var tabButton3: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(tab3Tapped), for: .touchUpInside)
        btn.frame = CGRect(x: screen.width * 2 / 3, y: 0, width: screen.width / 3, height: 54)
        return btn
    }()
    
    @objc func tab3Tapped() {
        tabIcon1.alpha = 1.0
        tabIcon2.alpha = 1.0
        tabIcon3.alpha = 0.0
        
        tab2View.alpha = 0.0
        tab3View.alpha = 1.0
        
        activeTabBg.frame = CGRect(x: screen.width - 72, y: 0, width: 72, height: 38)
        activeTabBg.roundCorners([.bottomLeft], radius: 10)
        
        activeTabView.frame = CGRect(x: screen.width - 64, y: -18, width: 58, height: 50)
        
        activeTabBgLeftSideCorner.frame = CGRect(x: screen.width - 88, y: 0, width: 16, height: 38)
        activeTabBgLeftSide.frame = CGRect(x: screen.width - 92, y: 0, width: 20, height: 38)
        
        activeTabBgRightSideCorner.frame = CGRect(x: screen.width, y: 0, width: 16, height: 38)
        activeTabBgRightSide.frame = CGRect(x: screen.width, y: 0, width: 20, height: 38)
        
        activeTabIcon.image = UIImage(named: "www")?.withRenderingMode(.alwaysTemplate)
        activeTabIcon.tintColor = UIColor(red: 130/255, green: 95/255, blue: 254/255, alpha: 1.0)
        activeTabIcon.frame = CGRect(x: 15, y: 10, width: 29, height: 29)
    }
}
