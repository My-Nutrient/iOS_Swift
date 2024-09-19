//
//  DailyCalorieData.swift
//  MynutrientPT
//
//  Created by Hwang_Inyoung on 9/12/24.
//

import Foundation

// 하루 칼로리 섭취 데이터를 위한 모델
struct DailyCalorieData: Identifiable {
    var id = UUID()
    var day: String  // 날짜를 문자열로 표현 (예: "9/1", "9/2")
    var calories: Double
}

// 칼로리 데이터 예시
let sampleCalorieData: [DailyCalorieData] = [
    DailyCalorieData(day: "9/1", calories: 2200),
    DailyCalorieData(day: "9/2", calories: 2100),
    DailyCalorieData(day: "9/3", calories: 2500),
    DailyCalorieData(day: "9/4", calories: 2300),
    DailyCalorieData(day: "9/5", calories: 2400),
    DailyCalorieData(day: "9/6", calories: 2000),
    DailyCalorieData(day: "9/7", calories: 2600),
    DailyCalorieData(day: "9/8", calories: 2250),
    DailyCalorieData(day: "9/9", calories: 2350),
    DailyCalorieData(day: "9/10", calories: 2450),
    DailyCalorieData(day: "9/11", calories: 2150),
    DailyCalorieData(day: "9/12", calories: 2500),
    DailyCalorieData(day: "9/13", calories: 2400),
    DailyCalorieData(day: "9/14", calories: 2200),
    DailyCalorieData(day: "9/15", calories: 2300),
    DailyCalorieData(day: "9/16", calories: 2350),
    DailyCalorieData(day: "9/17", calories: 2450),
    DailyCalorieData(day: "9/18", calories: 2550),
    DailyCalorieData(day: "9/19", calories: 2100),
    DailyCalorieData(day: "9/20", calories: 2250),
    DailyCalorieData(day: "9/21", calories: 2350),
    DailyCalorieData(day: "9/22", calories: 2400),
    DailyCalorieData(day: "9/23", calories: 2500),
    DailyCalorieData(day: "9/24", calories: 2600),
    DailyCalorieData(day: "9/25", calories: 2450),
    DailyCalorieData(day: "9/26", calories: 2300),
    DailyCalorieData(day: "9/27", calories: 2200),
    DailyCalorieData(day: "9/28", calories: 2100),
    DailyCalorieData(day: "9/29", calories: 2500),
    DailyCalorieData(day: "9/30", calories: 2350)
]
