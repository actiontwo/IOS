//
//  SwipingController.swift
//  auto-layout
//
//  Created by Actiontwo on 11/4/19.
//  Copyright © 2019 Actiontwo. All rights reserved.
//

import UIKit

class SwippingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let images = ["app-logo","skype","whatapp","phone"]
    let pages = [
        PageModel(imageName: "app-logo", headerText: "Wellcome to ABN Shop", bodyText: "This is a shop create by actiontwo"),
        PageModel(imageName: "skype", headerText: "This Skype Application can chat",bodyText: "This skype create by someone "),
        PageModel(imageName: "whatapp", headerText: "Whatapp is a new technology",bodyText: "Whatapp is from china"),
        PageModel(imageName: "phone", headerText: "If you have phone you can do everything",bodyText: "Everyone Have it")
    ]
    let prevButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1,0)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item:nextIndex,section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    let nextButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.mainPink, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1,pages.count - 1)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item:nextIndex,section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    
}
