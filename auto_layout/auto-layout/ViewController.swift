//
//  ViewController.swift
//  auto-layout
//
//  Created by Actiontwo on 11/4/19.
//  Copyright © 2019 Actiontwo. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red:232/255,green:68/255,blue: 133/255,alpha: 1)
}

class ViewController: UIViewController {
    
    let imageView : UIImageView = {
        let image = UIImageView(image:UIImage(named: "app-logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(
            string: "Welcome to ABN Shop",
            attributes:[NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
        )
        
        attributedText.append(NSAttributedString(
            string: "\n\nThere are some text need to define",
            attributes: [
                NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor:UIColor.gray
        ]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let prevButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls(){
        view.addSubview(prevButton)
        let bottomControlStackView = UIStackView(arrangedSubviews: [
            prevButton,pageControl,nextButton
        ])
        view.addSubview(bottomControlStackView)
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        view.addSubview(descriptionTextView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    
}

