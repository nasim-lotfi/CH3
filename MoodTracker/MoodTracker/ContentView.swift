//
//  ContentView.swift
//  MoodTracker
//
//  Created by nasim on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMood: String = ""
    @State private var selectedPeople: String = ""
    @State private var savedEntries: [DailyEntry] = []

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("How was your day?")
                    .font(.title2)

                HStack(spacing: 20) {
                    MoodButton(emoji: "😊", mood: "Happy", selectedMood: $selectedMood)
                    MoodButton(emoji: "😐", mood: "Neutral", selectedMood: $selectedMood)
                    MoodButton(emoji: "☹️", mood: "Sad", selectedMood: $selectedMood)
                }

                Text("Who have you been with?")
                    .font(.title2)
                HStack(spacing: 20) {
                    PeopleButton(label: "Friends", selectedPeople: $selectedPeople)
                    PeopleButton(label: "Family", selectedPeople: $selectedPeople)
                    PeopleButton(label: "Partner", selectedPeople: $selectedPeople)
                    PeopleButton(label: "None", selectedPeople: $selectedPeople)
                }

                Button(action: {
                    let newEntry = DailyEntry(date: Date(), mood: selectedMood, people: selectedPeople)
                    savedEntries.append(newEntry)
                }) {
                    Text("Save Entry")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }

                // لینک‌های صفحات مختلف
                NavigationLink(destination: ReportView(entries: savedEntries)) {
                    Text("Go to Report")
                        .foregroundColor(.blue)
                }

                NavigationLink(destination: CalendarView(entries: savedEntries)) {
                    Text("View Calendar")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .navigationTitle("Mood Tracker")
        }
    }
}
