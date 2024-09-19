//
//  MyPageView.swift
//  MynutrientPT
//
//  Created by Hwang_Inyoung on 9/12/24.
//

import SwiftUI
import Charts

// 5일씩 데이터를 그룹화하기 위한 확장 메서드
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

struct MyPageView: View {
    let data = sampleCalorieData
    
    // 총 칼로리 섭취량 계산
    var totalCalories: Double {
        data.reduce(0) { $0 + $1.calories }
    }
    
    // 5일씩 끊어서 데이터 그룹화
    var chunkedData: [[DailyCalorieData]] {
        data.chunked(into: 5)
    }
    
    // 선택된 차트를 관리할 상태 변수
    @State private var selectedRangeIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 상단 섹션: 칼로리 및 톱니바퀴 아이콘
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("9월 칼로리 섭취량")
                            .font(.title2)
                            .bold()
                        Text("\(Int(totalCalories)) kcal")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    
                    // 톱니바퀴 모양 아이콘 추가
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                // 날짜 선택을 위한 Picker
                Picker("날짜 선택", selection: $selectedRangeIndex) {
                    ForEach(0..<chunkedData.count, id: \.self) { index in
                        Text("9월 \(index * 5 + 1)일 - \(min((index + 1) * 5, data.count))일").tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // 선택된 날짜 범위의 선 그래프 보여주기 (심볼 추가)
                Chart {
                    ForEach(chunkedData[selectedRangeIndex]) { item in
                        LineMark(
                            x: .value("날짜", item.day),
                            y: .value("칼로리", item.calories)
                        )
                        .symbol(Circle()) // 심볼 추가 (원형 심볼)
                        .symbolSize(50) // 심볼 크기 설정
                        .lineStyle(StrokeStyle(lineWidth: 2))
                        .foregroundStyle(Color.red)
                    }
                }
                .frame(height: 200)
                .padding(.horizontal)
                
                Divider()
                
                // 필수 영양소와 비타민, 물을 수치와 함께 표시
                VStack(alignment: .leading, spacing: 20) {
                    SectionView(header: "필수 영양소", items: [
                        ("탄수화물", "300g  /  600g"),
                        ("단백질", "70g  /  150g"),
                        ("지방", "60g  /  120g")
                    ])
                    
                    SectionView(header: "비타민", items: [
                        ("비타민 A", "900µg  /  1500µg"),
                        ("비타민 B", "1.2mg  /  2mg"),
                        ("비타민 C", "90mg  /  150mg"),
                        ("비타민 D", "20µg  /  40µg")
                    ])
                    
                    SectionView(header: "기타", items: [
                        ("물", "2L  /  3L")
                    ])
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

// Custom View for each section
struct SectionView: View {
    var header: String
    var items: [(String, String)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(header)
                .font(.headline)
                .bold()
                .padding(.bottom, 5)
            
            ForEach(items, id: \.0) { item in
                HStack {
                    Text(item.0)
                    Spacer()
                    Text(item.1)
                        .foregroundColor(.gray)
                        .bold()
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    MyPageView()
}



/*
 // 5일씩 데이터를 그룹화하기 위한 확장 메서드
 extension Array {
     func chunked(into size: Int) -> [[Element]] {
         stride(from: 0, to: count, by: size).map {
             Array(self[$0..<Swift.min($0 + size, count)])
         }
     }
 }

 struct MyPageView: View {
     let data = sampleCalorieData
     
     // 총 칼로리 섭취량 계산
     var totalCalories: Double {
         data.reduce(0) { $0 + $1.calories }
     }
     
     // 5일씩 끊어서 데이터 그룹화
     var chunkedData: [[DailyCalorieData]] {
         data.chunked(into: 5)
     }
     
     // 선택된 차트를 관리할 상태 변수
     @State private var selectedRangeIndex = 0
     
     var body: some View {
         ScrollView {
             HStack {
                 VStack(alignment: .leading) {
                     Text("9월 칼로리 섭취량")
                     Text("\(Int(totalCalories)) kcal")
                         .font(.largeTitle)
                 }
                 Spacer()
                 
                 // 톱니바퀴 모양 아이콘 추가
                 Image(systemName: "gearshape.fill")
                     .font(.system(size: 30))
                     .foregroundColor(.gray)
             }
             .padding()
             
             // 날짜 선택을 위한 Picker
             Picker("날짜 선택", selection: $selectedRangeIndex) {
                 ForEach(0..<chunkedData.count, id: \.self) { index in
                     Text("9월 \(index * 5 + 1)일 - \(min((index + 1) * 5, data.count))일").tag(index)
                 }
             }
             .pickerStyle(SegmentedPickerStyle()) // Segmented 스타일의 피커 사용
             .padding()
             
             // 선택된 날짜 범위의 선 그래프 보여주기 (심볼 추가)
             Chart {
                 ForEach(chunkedData[selectedRangeIndex]) { item in
                     LineMark(
                         x: .value("날짜", item.day),
                         y: .value("칼로리", item.calories)
                     )
                     .symbol(Circle()) // 심볼 추가 (원형 심볼)
                     .symbolSize(50) // 심볼 크기 설정
                     .lineStyle(StrokeStyle(lineWidth: 2))
                     .foregroundStyle(Color.red)
                 }
             }
             .frame(height: 200)
             .padding(.horizontal)
             
             Divider()
             
             // 필수 영양소와 비타민, 물을 수치와 함께 표시
             VStack(alignment: .leading, spacing: 20) {
                 Section(header: Text("필수 영양소").font(.headline)) {
                     VStack(spacing: 10) {
                         HStack {
                             Text("탄수화물")
                             Spacer()
                             Text("300g  /  600g")
                         }
                         HStack {
                             Text("단백질")
                             Spacer()
                             Text("70g  /  150g")
                         }
                         HStack {
                             Text("지방")
                             Spacer()
                             Text("60g  /  120g")
                         }
                     }
                 }
                 
                 Section(header: Text("비타민").font(.headline)) {
                     VStack(spacing: 10) {
                         HStack {
                             Text("비타민 A")
                             Spacer()
                             Text("900µg  /  1500µg")
                         }
                         HStack {
                             Text("비타민 B")
                             Spacer()
                             Text("1.2mg  /  2mg")
                         }
                         HStack {
                             Text("비타민 C")
                             Spacer()
                             Text("90mg  /  150mg")
                         }
                         HStack {
                             Text("비타민 D")
                             Spacer()
                             Text("20µg  /  40µg")
                         }
                     }
                 }
                 
                 Section(header: Text("기타").font(.headline)) {
                     VStack(spacing: 10) {
                         HStack {
                             Text("물")
                             Spacer()
                             Text("2L  /  3L")
                         }
                     }
                 }
             }
             .padding(.horizontal)

             
             Spacer()
         }
     }
 }

 */
