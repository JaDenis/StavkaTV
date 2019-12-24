//
//  FeedVC.swift
//  Stavka-TV
//
//  Created by MacBook Air on 25/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let screen = UIScreen.main.bounds
    let headerHeight: CGFloat = 94
    
    @objc func showForecasts() {
        forecastsBtn.setTitleColor(.red, for: .normal)
        articlesBtn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        
        forecastsBtn.alpha = 0.3
        UIView.animate(withDuration: 0.3) {
            self.forecastsBtn.alpha = 1.0
            self.tabView.frame = CGRect(x: 32, y: 0, width: self.screen.width / 2 - 44, height: 4)
        }
        collectionView.scrollToItem(at:IndexPath(item: 0, section: 0), at: .right, animated: true)
    }
    
    @objc func showArticles() {
        forecastsBtn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        articlesBtn.setTitleColor(.red, for: .normal)
        
        articlesBtn.alpha = 0.3
        UIView.animate(withDuration: 0.3) {
            self.articlesBtn.alpha = 1.0
            self.tabView.frame = CGRect(x: 12, y: 0, width: self.screen.width / 2 - 44, height: 4)
        }
        collectionView.scrollToItem(at:IndexPath(item: 1, section: 0), at: .right, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        
        navigationController?.navigationBar.addSubview(leftButton)
        navigationController?.navigationBar.addSubview(rightButton)
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
        collectionView.register(ArticlesCell.self, forCellWithReuseIdentifier: "ArticlesCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        view.addSubview(tabBarView)
        tabBarView.addSubview(forecastsBtn)
        tabBarView.addSubview(articlesBtn)
        tabBarView.addSubview(tabSelector)
        tabSelector.addSubview(tabView)
        
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
    //==================================================//
    //================= TabBar =========================//
    //==================================================//
    lazy var tabBarView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.frame = CGRect(x: 0, y: 72, width: UIScreen.main.bounds.size.width, height: 42)
        return v
    }()
    lazy var tabSelector: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 38, width: self.screen.width / 2, height: 4)
        return view
    }()
    
    lazy var tabView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 32, y: 0, width: self.screen.width / 2 - 44, height: 4)
        view.roundCorners([.topLeft, . topRight], radius: 3)
        return view
    }()
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.01) {
            self.tabSelector.transform = CGAffineTransform(translationX: scrollView.contentOffset.x / 2, y: 0)
        }
        self.view.endEditing(true)
    }
    
    lazy var forecastsBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.frame = CGRect(x: 0, y: 0, width: self.screen.size.width / 2, height: 42)
        btn.backgroundColor = .clear
        btn.setTitleColor(.red, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 4, right: 0)
        btn.setTitle("Лучшее", for: .normal)
        btn.addTarget(self, action: #selector(showForecasts), for: .touchUpInside)
        return btn
    }()
    
    lazy var articlesBtn: UIButton = {
        let btn = UIButton()
        btn.tag = 2
        btn.frame = CGRect(x: self.screen.size.width / 2 , y: 0, width: self.screen.size.width / 2, height: 42)
        btn.backgroundColor = .clear
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 26)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        btn.setTitle("Подписки", for: .normal)
        btn.addTarget(self, action: #selector(showArticles), for: .touchUpInside)
        return btn
    }()
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        print(pageNumber)
        
        switch pageNumber {
        case 0:
            articlesBtn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            forecastsBtn.setTitleColor(.red, for: .normal)
            
            forecastsBtn.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.forecastsBtn.alpha = 1.0
                self.tabView.frame = CGRect(x: 32, y: 0, width: self.screen.width / 2 - 44, height: 4)
            }
        case 1:
            articlesBtn.setTitleColor(.red, for: .normal)
            forecastsBtn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
            
            articlesBtn.alpha = 0.3
            UIView.animate(withDuration: 0.3) {
                self.articlesBtn.alpha = 1.0
                self.tabView.frame = CGRect(x: 12, y: 0, width: self.screen.width / 2 - 44, height: 4)
            }
        default:
            break
        }
    }
    
    //==================================================//
    //=================== HeaderView ===================//
    //==================================================//
    
    lazy var leftButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 20, y: 16, width: 23, height: 20)
        btn.setImage(UIImage(named: "filterIcon"), for: .normal)
        btn.addTarget(self, action: #selector(leftBarButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: screen.width - 20 - 22, y: 16, width: 20, height: 20)
        btn.setImage(UIImage(named: "search"), for: .normal)
        btn.addTarget(self, action: #selector(rightBarButtonTapped), for: .touchUpInside)
        return btn
    }()
 
    @objc func leftBarButtonTapped() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "showModal"), object: nil, userInfo: nil)
    }
    
    @objc func rightBarButtonTapped() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "showModal"), object: nil, userInfo: nil)
    }
    
    //==================================================//
    //================= CollectionView =================//
    //==================================================//
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let frame = CGRect(x: 0, y: 114,
                           width: UIScreen.main.bounds.size.width,
                           height: UIScreen.main.bounds.size.height - 114)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.contentInset = UIEdgeInsets(top: 86, left: 0, bottom: 0, right: 0)
        collectionView.alwaysBounceHorizontal = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as! FeedCell
            
            return cell
            
        } else if indexPath.item == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCell", for: indexPath) as! ArticlesCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // let cell = collectionView.cellForItem(at: indexPath) as! BetCell
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
