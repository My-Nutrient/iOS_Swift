//
//  extension+date.swift
//  MynutrientPT
//
//  Created by 김동경 on 2024/09/12.
//

import Foundation


extension Date {
    //오후 3시 25분 식으로 문자열 반환하기 위한 extension
    var formattedTime: String {
        let formatter = DateFormatter()  //데이터 포맷터
        formatter.locale = Locale(identifier: "ko_KR") //포맷터 지역 - 한국
        formatter.dateFormat = "a hh:mm"    //데이터 형식
        return formatter.string(from: self) //포맷터의 문자열 반환
    }
   
}
