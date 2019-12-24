//
//  WinlineCell.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class SponsorCell: UITableViewCell {
    let screen = UIScreen.main.bounds
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .gray
        addSubview(bg)
        bg.addSubview(sponsorIcon)
        bg.addSubview(sponsorTitleLabel)
        bg.addSubview(bodyContainer)
        bodyContainer.addSubview(sponsorSubtitleLabel)
        bg.addSubview(sponsorButton)
    }
    
    override func prepareForReuse() {
        bg.alpha = 1.0
        sponsorIcon.alpha = 1.0
        sponsorTitleLabel.alpha = 1.0
        sponsorSubtitleLabel.alpha = 1.0
        sponsorButton.alpha = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bg: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 8, y: 8, width: screen.width - 16, height: 158)
        view.backgroundColor = .white
        view.roundCorners([.allCorners], radius: 20)
        return view
    }()
    
    lazy var sponsorIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "winline")
        img.frame = CGRect(x: screen.width - 122, y: 4, width: 100, height: 46)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var sponsorTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 16, y: 16, width: screen.width - 136, height: 24)
        label.text = "Фрибет за скачивание"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var bodyContainer: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 8, y: 50, width: screen.width - 32, height: 58)
        view.roundCorners([.allCorners], radius: 12)
        view.backgroundColor = .lightGray2
        return view
    }()
    
    lazy var sponsorSubtitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 8, y: 8, width: screen.width - 40, height: 42)
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 13)
        let firstAttributes: [NSAttributedString.Key: Any] = [:]
        let secondAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        let firstString = NSMutableAttributedString(string: "Просто установи Winline и получи бесплатную ", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "ставку на 1000 рублей.", attributes: secondAttributes)
        firstString.append(secondString)
        label.attributedText = firstString
        return label
    }()
    
    lazy var sponsorButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 8, y: 114, width: screen.width - 32, height: 36)
        btn.setTitle("Получить", for: .normal)
        btn.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 41/255, alpha: 1.0)
        btn.setTitleColor(.white, for: .normal)
        btn.roundCorners([.allCorners], radius: 20)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        return btn
    }()
}
