//
//  Meal.swift
//  TestApp
//
//  Created by Kasai, Sohei on 2018/01/28.
//  Copyright © 2018年 Kasai, Sohei. All rights reserved.
//

import UIKit

class Meal {
    //MARK: properties
    var name:String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initilization
    init?(name: String, photo: UIImage?, rating:Int) {
        // name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating muse be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
