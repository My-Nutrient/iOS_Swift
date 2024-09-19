//
//  MonthCalendarView.swift
//  MynutrientPT
//
//  Created by 이다영 on 9/19/24.
//

import SwiftUI

struct MonthCalendarView: View {
    @Binding var selectedDate: Date
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()
            }
            .navigationBarTitle("캘린더", displayMode: .inline)
            .navigationBarItems(trailing: Button("완료") {
                isPresented = false
            })
        }
    }
}

struct MonthCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MonthCalendarView(selectedDate: .constant(Date()), isPresented: .constant(true))
    }
}
