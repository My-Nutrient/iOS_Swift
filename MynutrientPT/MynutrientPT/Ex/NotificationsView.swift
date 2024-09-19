//
//  NotificationsView.swift
//  MynutrientPT
//
//  Created by 이다영 on 9/19/24.
//

import SwiftUI

struct NotificationsView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            List {
                NotificationItem(title: "식사 시간입니다", message: "건강한 식사 하세요!")
                NotificationItem(title: "영양제 복용 시간", message: "영양제 드셨나요?")
                NotificationItem(title: "운동 알림", message: "오늘의 운동을 시작해보세요")
            }
            .navigationBarTitle("알림", displayMode: .inline)
            .navigationBarItems(trailing: Button("닫기") {
                isPresented = false
            })
        }
    }
}

struct NotificationItem: View {
    let title: String
    let message: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(isPresented: .constant(true))
    }
}
