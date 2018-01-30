//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Kasai, Sohei on 2018/01/27.
//  Copyright © 2018年 Kasai, Sohei. All rights reserved.
//

import XCTest
@testable import TestApp

class TestAppTests: XCTestCase {
    //MARK: Meal Class Tests
    func testMealInitializationSucceeds(){
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo:nil, rating:0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails(){
        // Negative rating meal
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Over rating Meal
        let overRatingMeal = Meal.init(name: "Over Rating", photo: nil, rating: 10)
        XCTAssertNil(overRatingMeal)
        
        // Empty String
        let emptyNameMeal = Meal.init(name: "", photo: nil, rating: 3)
        XCTAssertNil(emptyNameMeal)
    }
    
}
