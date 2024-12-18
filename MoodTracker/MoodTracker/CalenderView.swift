//
//  CalenderView.swift
//  MoodTracker
//
//  Created by nasim on 18/12/24.
//

import SwiftUI

struct CalendarView: View {
    let entries: [DailyEntry]
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            Text("Mood Calendar")
                .font(.largeTitle)
                .padding()

            // نمایش DatePicker به شکل تقویم
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()

            // نمایش اطلاعات ثبت‌شده برای تاریخ انتخاب‌شده
            if let entry = entries.first(where: { isSameDay($0.date, selectedDate) }) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Mood: \(entry.mood)")
                        .font(.headline)
                    Text("With: \(entry.people)")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.green.opacity(0.3))
                .cornerRadius(10)
            } else {
                Text("No entry for this date")
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
    }

    // بررسی اینکه دو تاریخ یکسان هستند یا نه
    private func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}
