//
//  EmptyVC.swift
//  Stavka-TV
//
//  Created by MacBook Air on 25/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class EmptyVC: UIViewController {
    let screen = UIScreen.main.bounds
    let headerHeight: CGFloat = 94

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
    lazy var bg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Bg_for_header")
        img.contentMode = .scaleAspectFill
        img.frame = CGRect(x: 0, y: -20, width: screen.width, height: screen.height - 20)
        return img
    }()

}

