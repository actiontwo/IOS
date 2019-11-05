//
//  SwipingController+extention.swift
//  auto-layout
//
//  Created by Actiontwo on 11/5/19.
//  Copyright © 2019 Actiontwo. All rights reserved.
//

import UIKit

extension SwippingController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: {(_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }else {
                let indexPath = IndexPath(item:self.pageControl.currentPage,section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }, completion: {
            (_) in
        })
    }
}
