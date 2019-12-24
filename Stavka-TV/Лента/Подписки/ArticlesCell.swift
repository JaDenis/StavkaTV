//
//  ArticlesCell.swift
//  Stavka-TV
//
//  Created by MacBook Air on 25/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class ArticlesCell: UICollectionViewCell {
    let screen = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bg)
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(button)
    }
    
    lazy var bg: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 14, width: screen.width, height: screen.height - 40)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 16)
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: screen.width / 2 - 40, y: 56, width: 82, height: 82)
        img.image = UIImage(named: "no_subscribtion")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 130, width: screen.width, height: 100)
        label.text = "Прогнозы по твоим\nподпискам не найдены"
        label.font = UIFont(name: "GothamPro", size: 22)
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: 2.0) // try values 1.0 to 5.0
        label.textAlignment = .center
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 188, width: screen.width, height: 100)
        label.text = "Подпишись на интересующего прогнозиста в его профиле"
        label.font = UIFont(name: "GothamPro-Light", size: 17)
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: 2.0) // try values 1.0 to 5.0
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    lazy var button: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 48, y: 294, width: screen.width - 98, height: 76)
        label.text = "Выбрать тех, кому\nдоверяешь"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont(name: "GothamPro", size: 19)
        label.backgroundColor = .blue
        label.roundCorners([.allCorners], radius: 50)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
