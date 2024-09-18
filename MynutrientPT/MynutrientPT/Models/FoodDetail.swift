//
//  Nutrient.swift
//  MynutrientPT
//
//  Created by 홍지수 on 9/13/24.
//

import SwiftUI

struct FoodDetail: Identifiable {
    var id = UUID()
    
    var foodName: String
    var kcal: Int
    // 영양 성분 구성
    var nutrients: [Nutrient]
    
//    init(id: UUID = UUID(), foodName: String, kcal: Int, nutrients: [Nutrient]) {
//        self.id = id
//        self.foodName = foodName
//        self.kcal = kcal
//        self.nutrients = nutrients
//    }
}

// 영양성분
struct Nutrient: Identifiable {
    var id = UUID()
    
    var nutrientName: String
    var volume: Int
    var ratio: Int
}
