//
//  cart.swift
//  MynutrientPT
//
//  Created by 김동경 on 2024/09/12.
//

import Foundation


struct Cart: Identifiable {
    var id: UUID = UUID()
    var title: String
    var date: Date = Date()
    var cal: Int
}



var cartData: [Cart] = [
    Cart(title: "폭식 계산기", cal: 1024),
    Cart(title: "소식 계산기", cal: 24),
    Cart(title: "즁삭 계산기", cal: 502)
]
