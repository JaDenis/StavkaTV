//
//  CityPicker.swift
//  GIG
//
//  Created by iOS on 14.06.2019.
//  Copyright © 2019 Maksym Shulha. All rights reserved.
//

import UIKit
import CoreLocation

protocol CityPickerDelegate: class {
    func cityPickerCanceled()
    func cityPickerDone(cityID: Int)
}

class ModalView: UIView, UIGestureRecognizerDelegate {
    let screen = UIScreen.main.bounds
    
    let bg = UIView()
    var blurView = UIVisualEffectView()
    var blurEffect = UIBlurEffect()
    var cachedFrame: CGRect?
    var isHiding = false
    
//    let cities = sharedLocationManager.cities
    weak var delegate: CityPickerDelegate?
    
    var isDarkTheme = false {
        didSet {
            blurEffect = UIBlurEffect(style: isDarkTheme ? .dark : .light)
        }
    }
    
    var suggestedCityPrepositional: String = "" {
        didSet {
//            suggestTitle.text = LanguageManager.localizedString("localized_52") + " \(suggestedCityPrepositional)"
        }
    }
    
    init(view: UIView) {
        super.init(frame: CGRect(x: 0, y: screen.height / 2,
                                 width: screen.width,
                                 height: screen.height))
        backgroundColor = .white
        roundCorners([.topLeft, .topRight], radius: 14)
        setupTheme()
        
        createPanGestureRecognizer(targetView: self)
//        createShadow()
//        createSuggestView()
//        createPickerView()
        
        createBg(view)
        createHeader()
        show()
        
        NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeChanged(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }
    
    @objc func done() {
//        delegate?.cityPickerDone(cityID: suggestedCityID)
        hide()
    }
    
    @objc func cancel() {
        delegate?.cityPickerCanceled()
        hide()
    }
    
    @objc func bgTap() {
        delegate?.cityPickerCanceled()
        hide()
    }
    
    func setupTheme() {
        if #available(iOS 12.0, *) {
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                isDarkTheme = true
            } else {
                isDarkTheme = false
            }
        } else {
            blurEffect = UIBlurEffect(style: .dark)
        }
        blurEffect = UIBlurEffect(style: isDarkTheme ? .dark : .light)
    }
    
    // MARK: - Handle Theme changes from Control Panel
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .light {
                print("Light mode")
                isDarkTheme = false
            } else {
                print("Dark mode")
                isDarkTheme = true
            }
        } else {
            // Fallback on earlier versions
            print("no dark mode in iOS \(UIDevice.current.systemVersion)")
        }
    }
    
    // MARK: - Handle Font Size changes from Control Panel
    var contentSizeFactor: CGFloat = 1.0
    @objc func preferredContentSizeChanged(_ notification: Notification) {
        let contentSizes = ["UICTContentSizeCategoryXS",
                            "UICTContentSizeCategoryS",
                            "UICTContentSizeCategoryM",
                            "UICTContentSizeCategoryL",
                            "UICTContentSizeCategoryXL",
                            "UICTContentSizeCategoryXXL",
                            "UICTContentSizeCategoryXXXL"]
        
        for contentSize in contentSizes {
            if  notification.description.contains(contentSize) {
                print(contentSize)
                
                switch contentSize {
                case "UICTContentSizeCategoryXS":
                    contentSizeFactor = 0.6
                case "UICTContentSizeCategoryS":
                    contentSizeFactor = 0.7
                case "UICTContentSizeCategoryM":
                    contentSizeFactor = 0.8
                case "UICTContentSizeCategoryL":
                    contentSizeFactor = 0.9
                case "UICTContentSizeCategoryXL":
                    contentSizeFactor = 1.0
                case "UICTContentSizeCategoryXXL":
                    contentSizeFactor = 1.1
                case "UICTContentSizeCategoryXXXL":
                    contentSizeFactor = 1.2
                default:
                    break
                }
            }
        }
//        pickerView.reloadAllComponents()
    }
    
    func createHeader() {
        addSubview(header)
        addSubview(headerUnderline)
    }
    
    
    
    func indexFor(subview: UIView) -> Int {
        var viewIndex = 0
        for view in subviews {
            if view == subview {
                if let index = subviews.index(of: subview) {
                    viewIndex = index
                }
            }
        }
        return viewIndex
    }
    func createBg(_ view: UIView) {
        bg.frame = screen
        bg.backgroundColor = .black
        bg.alpha = 0.0
        let bgGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bgTap))
        bgGestureRecognizer.delegate = self
        bg.addGestureRecognizer(bgGestureRecognizer)
        view.addSubview(bg)
    }
    
    func createShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 0) //default is (0.0, -3.0)
        self.layer.shadowColor = UIColor.black.cgColor //default is black
        self.layer.shadowRadius = 40.0 //default is 3.0
        self.layer.shadowOpacity = 1.0 //default is 0.0
    }
    
    func show() {
        self.frame = CGRect(x: 0, y: screen.height, width: screen.width, height: screen.height)
        cachedFrame = CGRect(x: 0, y: screen.height / 2 - 140, width: screen.width, height: screen.height - 100)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.frame = self.cachedFrame!
            self.alpha = 1.0
            self.bg.alpha = 0.6
        }, completion: { _ in
//            self.showSuggestView()
        })
    }
    
    func hide() {
        isHiding = true
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
//            self.suggestView.frame = CGRect(x: 16, y: -130, width: self.screen.width - 32, height: 100)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//                self.suggestView.frame = CGRect(x: 16, y: 40, width: self.screen.width - 32, height: 100)
//                self.suggestView.alpha = 0
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.frame = CGRect(x: 0, y: self.screen.height, width: self.screen.width, height: self.screen.height)
                    self.bg.alpha = 0.0
                    self.alpha = 0.35
                }, completion: { [weak self] _ in
                    self?.removeFromSuperview()
                    self?.bg.removeFromSuperview()
//                    sharedLocationManager.isCityPickerShown = false
                })
            })
        })
    }
    
    
    func createPanGestureRecognizer(targetView: UIView) {
        let panGesture = UIPanGestureRecognizer(target: self, action:(#selector(handlePanGesture(panGesture:))))
        targetView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        // get translation
        let translation = panGesture.translation(in: self)
        panGesture.setTranslation(CGPoint.zero, in: self)
        
        let label = panGesture.view
        label?.center = CGPoint(x: screen.size.width * 0.5,
                                y: (label?.center.y)!+translation.y)
        
        label?.isMultipleTouchEnabled = true
        label?.isUserInteractionEnabled = true
        
        if panGesture.state == UIGestureRecognizer.State.began {
            // add something you want to happen when the Label Panning has started
        }
        
        if panGesture.state == UIGestureRecognizer.State.ended {
            if !isHiding {
                UIView.animate(withDuration: 0.3, animations: {
                    self.frame = self.cachedFrame!
                }, completion: { _ in })
            }
        }
        
        if panGesture.state == UIGestureRecognizer.State.changed {
            // add something you want to happen when the Label Panning has been change ( during the moving/panning )
            print(panGesture.velocity(in: self.superview))
            if translation.y > 20 {
                hide()
            }
        } else {
            // or something when its not moving
        }
    }
    
    lazy var header: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.screen.width, height: 43)
        v.backgroundColor = .lightGray
        v.roundCorners([.topLeft, .topRight], radius: 14)
        return v
    }()
    
    lazy var headerUnderline: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 0, y: 43, width: screen.width, height: 2)
        v.backgroundColor = .white
        return v
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
