//
//  CalendarView_ex.swift
//  MynutrientPT
//
//  Created by 이다영 on 9/19/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var mealData: [MealData] = MealData.sampleData
    
    // sheet
    @State private var isCalendarPresented = false
    @State private var isNutritionGraphPresented = false
    @State private var isNotificationsPresented = false
    
    // 토글
    @State private var tookSupplements = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // 날짜 가로 스크롤뷰
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        // 선택 날짜에서 7개 표시(-3일 & 현재 & +3일)
                        ForEach(-3...3, id: \.self) { offset in
                            // 날짜 표시
                            DateView(date: Calendar.current.date(byAdding: .day, value: offset, to: selectedDate) ?? selectedDate, isSelected: offset == 0)
                            // 날짜 탭할 때 액션(선택날짜 업데이트)
                                .onTapGesture {
                                    selectedDate = Calendar.current.date(byAdding: .day, value: offset, to: selectedDate) ?? selectedDate
                                }
                        }
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.1)) // 투명도 10%
                
                // 메인 콘텐츠 (세로 스크롤)
                ScrollView {
                    VStack(spacing: 20) {
                        // 식단 데이터 (가로 스크롤)
                        VStack(alignment: .leading) {
                            Text("오늘의 식단")
                                .font(.headline)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(["아침", "점심", "저녁"], id: \.self) { meal in
                                        mealCard(title: meal, meal: "샘플 식단")
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // 영양제 섭취 체크
                        VStack(alignment: .leading) {
                            Text("영양제를 먹었나요?")
                                .font(.headline)
                            
                            Toggle("영양제 섭취", isOn: $tookSupplements)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(formattedDate)
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        // 월 기준 캘린더 확인
                        Button(action: { isCalendarPresented = true }) {
                            Image(systemName: "calendar")
                        }
                        
                        // 섭취 영양성분 그래프 확인
                        Button(action: { isNutritionGraphPresented = true }) {
                            Image(systemName: "chart.bar")
                        }
                        
                        // 알림 센터
                        Button(action: { isNotificationsPresented = true }) {
                            Image(systemName: "bell")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isCalendarPresented) {
            MonthCalendarView(selectedDate: $selectedDate, isPresented: $isCalendarPresented)
        }
        .sheet(isPresented: $isNutritionGraphPresented) {
            NutritionGraphView(isPresented: $isNutritionGraphPresented)
        }
        .sheet(isPresented: $isNotificationsPresented) {
            NotificationsView(isPresented: $isNotificationsPresented)
        }
    }
    
    // 날짜 포맷
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일, EEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: selectedDate)
    }
    
    func mealCard(title: String, meal: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text(meal)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(width: 120, height: 150)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

// 날짜 표시
struct DateView: View {
    let date: Date // 표시할 날짜(현재날짜 + offset)
    let isSelected: Bool // 현재 날짜가 선택된 날짜인지 (offset = 0일 때, true)
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.caption)
            Text(dayOfMonth)
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(width: 40, height: 60)
        .foregroundColor(isSelected ? .white : .primary)
        .cornerRadius(10)
        .background(isSelected ? Color.blue : Color.clear)
    }
    
    // 요일 출력
    var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    // 일 출력
    var dayOfMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
