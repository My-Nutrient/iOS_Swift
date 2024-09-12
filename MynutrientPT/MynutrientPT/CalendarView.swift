//
//  CalendarView.swift
//  MynutrientPT
//
//  Created by 이다영 on 9/12/24.
//
// 캘린더를 내려볼 수 있는 ScrollView가 필요한가?

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var mealData: [MealData] = MealData.sampleData
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text("캘린더")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button(action: {
                        // 홈 탭으로 돌아가기
                        print("Button tapped")
                    }, label: {
                        Text("Home")
                    })
                    .font(.title)
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                
                // 식단 기록 표시
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(formattedDate) ")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            displayMealData()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                Spacer(minLength: 120)
                
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일 (E)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: selectedDate)
    }
    
    // 데이터 출력
    @ViewBuilder
    func displayMealData() -> some View {
        let calendar = Calendar.current
        if let selectedMeal = mealData.first(where: { calendar.isDate($0.date, inSameDayAs: selectedDate) }) {
            Group {
                mealCard(title: "아침", meal: selectedMeal.breakfast)
                mealCard(title: "점심", meal: selectedMeal.lunch)
                mealCard(title: "저녁", meal: selectedMeal.dinner)
            }
        } else {
            mealCard(title: "No Data", meal: "식사 데이터가 없습니다")
        }
    }
    
    // 식단 나오는 셀
    func mealCard(title: String, meal: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 10)
            
            Text(meal)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .center)
                
        }
        .frame(width: 120, height: 150)
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 3)
        )
        .multilineTextAlignment(.center)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
