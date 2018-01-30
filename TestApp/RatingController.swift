//
//  RatingController.swift
//  TestApp
//
//  Created by Kasai, Sohei on 2018/01/28.
//  Copyright © 2018年 Kasai, Sohei. All rights reserved.
//

import UIKit

@IBDesignable class RatingController: UIStackView {

    //MARK: properties
    private var ratingButtons:[UIButton] = [UIButton]()
    var ratingx = 0
    var rating = 0 {
        didSet {
            updateButtonSelectedStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setupButtons()
        }
    }

    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }

    //MARK: initilization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Action
    @objc func ratingButtonTapped(button: UIButton){
        print("Button pressed")
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, ¥(button), is not in the ratingButtons array: ¥(ratingButtons)")
        }
        
        let selectedRating = index + 1
        if selectedRating == rating{
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    //MARK: Private methods
    private func setupButtons(){
        // Clear all existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        // Load button images
        let bundle = Bundle(for: type(of: self))
        
        let filledStar = UIImage(named: "FilledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "HighlightedStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "EmptyStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            
            // Create button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Add Accessibility level
            button.accessibilityLabel = "Set ¥(index + 1) star rating"
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingController.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            ratingButtons.append(button)
        }
        
        updateButtonSelectedStates()
    }
    
    private func updateButtonSelectedStates(){
        for(index, button) in ratingButtons.enumerated() {
            // If index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
            
            let hintString: String?
            if rating == index+1 {
                hintString = "Tap to reset the rating to Zero"
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch(rating){
            case 0:
                valueString = "No rating set"
            case 1:
                valueString = "1 star set"
            default:
                valueString = "¥(rating) stars set"
            }
            
            // Assing the hint and value Strings
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
        
        
    }
    

}
