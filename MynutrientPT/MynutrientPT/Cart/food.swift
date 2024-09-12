//
//  래ㅐㅇ.swift
//  MynutrientPT
//
//  Created by 김동경 on 2024/09/12.
//

import SwiftUI


struct Food: Identifiable {
    var id: UUID = UUID()
    var name: String
    var imageUrl: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Ci6YkdFEjuONWRlJ-ksW_Iszr2aDmUfGuw&s"
    
    var image: Image {
        Image(imageUrl)
    }
}


var foodData: [Food] = [
    Food(name: "연어"),
    Food(name: "고기"),
    Food(name: "생선"),
    Food(name: "콩"),
    Food(name: "햄"),
    Food(name: "물"),
    Food(name: "시금치"),
    Food(name: "브로콜리"),
    Food(name: "망고"),
    Food(name: "사과"),
    Food(name: "복숭아"),
]
