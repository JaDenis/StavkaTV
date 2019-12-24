//
//  TurnOnNotificationCell.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class TurnOnNotificationCell: UITableViewCell {
    let screen = UIScreen.main.bounds
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .gray
        addSubview(bg)
        bg.addSubview(notifIcon)
        bg.addSubview(notifTitleLabel)
        bg.addSubview(notifButton)
    }
    
    override func prepareForReuse() {
        bg.alpha = 1.0
        notifIcon.alpha = 1.0
        notifTitleLabel.alpha = 1.0
        notifButton.alpha = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bg: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 8, y: 8, width: screen.width - 16, height: 114)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 20)
        return view
    }()
    
    lazy var notifIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "notification")
        img.frame = CGRect(x: 13, y: 14, width: 46, height: 46)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var notifTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 10, width: screen.width - 96, height: 60)
        label.text = "Чтобы быть в курсе о прогнозах\nот прогнозистов, которым ты\nдоверяешь"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var notifButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 70, y: 74, width: screen.width - 144, height: 28)
        btn.setTitle("ВКЛЮЧИ УВЕДОМЛЕНИЯ", for: .normal)
        btn.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        btn.layer.borderWidth = 1
        btn.setTitleColor(UIColor(red: 43/255, green: 43/255, blue: 41/255, alpha: 1.0), for: .normal)
        btn.layer.cornerRadius = 14
        btn.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        return btn
    }()
}
