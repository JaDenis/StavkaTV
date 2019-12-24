//
//  ThatsAllCell.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class ThatsAllCell: UITableViewCell {
    let screen = UIScreen.main.bounds
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bg)
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    override func prepareForReuse() {
        bg.alpha = 1.0
        iconImageView.alpha = 1.0
        titleLabel.alpha = 1.0
        subtitleLabel.alpha = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        img.image = UIImage(named: "thatsAll")
        img.frame = CGRect(x: screen.width / 2 - 25, y: 20, width: 50, height: 50)
        img.contentMode = .scaleAspectFit
        img.roundCorners([.allCorners], radius: 25)
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 76, width: screen.width, height: 22)
        label.text = "На этом пока всё"
        label.font = UIFont(name: "GothamPro", size: 16)
        label.numberOfLines = 2
        label.setLineSpacing(lineSpacing: 2.0) // try values 1.0 to 5.0
        label.textAlignment = .center
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 104, width: screen.width, height: 56)
        label.text = "Ты просмотрел все актуальные\nпрогнозы от прогнозистов, на которых\n подписан"
        label.font = UIFont(name: "GothamPro-Light", size: 14)
        label.numberOfLines = 3
        label.setLineSpacing(lineSpacing: 2.0) // try values 1.0 to 5.0
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
}
