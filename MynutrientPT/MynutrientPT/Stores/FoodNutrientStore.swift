//
//  FoodNutrientStore.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/13/24.
//

import SwiftUI

//@Environment ([FoodNutrient.self]) var FoodNutrientStore =  [
//    FoodNutrient(foodName: "Pizza", nutrientName: "단백질", volume: 23, ratio: 10)
//]

@Observable
class FoodNutrientStore {
    var foods: [FoodDetail] = []
    var query: String = ""
    
    
    init() {
#if DEBUG
        foods = [
            FoodDetail(foodName: "pizza", kcal: 640, nutrients: [
                Nutrient(nutrientName: "탄수화물", volume: 108, ratio: 50),
                Nutrient(nutrientName: "단백질", volume: 30, ratio: 15),
                Nutrient(nutrientName: "지방", volume: 55, ratio: 35)
            ]),
            FoodDetail(foodName: "Hamburger", kcal: 540, nutrients: [
                Nutrient(nutrientName: "탄수화물", volume: 108, ratio: 50),
                Nutrient(nutrientName: "단백질", volume: 30, ratio: 15),
                Nutrient(nutrientName: "지방", volume: 55, ratio: 35)
            ])
        ]
#endif
    }
    
    
}
