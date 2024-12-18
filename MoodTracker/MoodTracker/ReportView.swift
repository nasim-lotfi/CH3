//
//  ReportView.swift
//  MoodTracker
//
//  Created by nasim on 18/12/24.
//


import SwiftUI

struct ReportView: View {
    let entries: [DailyEntry]

    var body: some View {
        VStack {
            Text("Monthly Report")
                .font(.largeTitle)
                .padding()

            List(entries) { entry in
                VStack(alignment: .leading) {
                    Text("Date: \(formattedDate(entry.date))")
                        .font(.headline)
                    Text("Mood: \(entry.mood)")
                    Text("With: \(entry.people)")
                }
                .padding()
            }
        }
    }

    // فرمت تاریخ
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
