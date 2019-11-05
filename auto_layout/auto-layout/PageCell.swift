//
//  PageCell.swift
//  auto-layout
//
//  Created by Actiontwo on 11/4/19.
//  Copyright © 2019 Actiontwo. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page : PageModel?  {
        didSet {
            guard let uPage = page else {return}
            imageView.image = UIImage(named: uPage.imageName)
            descriptionTextView.attributedText =  self.setDescriptionText(header:uPage.headerText,body:uPage.bodyText)
            descriptionTextView.textAlignment = .center
            
        }
    }
    private let imageView : UIImageView = {
        let image = UIImageView(image:UIImage(named: "app-logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private func setDescriptionText(header:String,body:String)-> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(
            string: header,
            attributes:[NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
        )
        
        attributedText.append(NSAttributedString(
            string: "\n\n\(body)",
            attributes: [
                NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor:UIColor.gray
        ]))
        
        return attributedText
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        descriptionTextView.attributedText =  self.setDescriptionText(header:"Welcome To Abn Shop",body:"There are some text need to define")
        descriptionTextView.textAlignment = .center
        addSubview(descriptionTextView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
