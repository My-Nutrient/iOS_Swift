//
//  MealData.swift
//  MynutrientPT
//
//  Created by 이다영 on 9/12/24.
//

import Foundation

struct MealData: Identifiable {
    let id = UUID()
    let date: Date
    let breakfast: String
    let lunch: String
    let dinner: String
}

// 샘플 데이터를 위한 extension
extension MealData {
    static var sampleData: [MealData] = [
        MealData(date: Date(), breakfast: "빵", lunch: "빵", dinner: "빵"),
        MealData(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, breakfast: "고기", lunch: "고기", dinner: "고기"),
        MealData(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, breakfast: "국수", lunch: "국수", dinner: "국수"),
    ]
}
