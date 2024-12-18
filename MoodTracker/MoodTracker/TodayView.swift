//
//  TodayView.swift
//  MoodTracker
//
//  Created by nasim on 18/12/24.
//
import SwiftUI

struct TodayView: View {
    @State private var selectedMood: String = ""
    @State private var selectedPeople: String = ""
    @State private var savedEntries: [DailyEntry] = []

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("How was your day?")
                    .font(.title2)
                // انتخاب حالت روحی
                HStack(spacing: 20) {
                    MoodButton(emoji: "😊", mood: "Happy", selectedMood: $selectedMood)
                    MoodButton(emoji: "😐", mood: "Neutral", selectedMood: $selectedMood)
                    MoodButton(emoji: "☹️", mood: "Sad", selectedMood: $selectedMood)
                }

                Text("Who have you been with?")
                    .font(.title2)
                // انتخاب افراد
                HStack(spacing: 20) {
                    PeopleButton(label: "Friends", selectedPeople: $selectedPeople)
                    PeopleButton(label: "Family", selectedPeople: $selectedPeople)
                    PeopleButton(label: "Partner", selectedPeople: $selectedPeople)
                    PeopleButton(label: "None", selectedPeople: $selectedPeople)
                }

                // دکمه ذخیره اطلاعات
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

                NavigationLink(destination: ReportView(entries: savedEntries)) {
                    Text("Go to Report")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .navigationTitle("Mood Tracker")
        }
    }
}

// مدل داده برای ثبت اطلاعات روزانه
struct DailyEntry: Identifiable {
    let id = UUID()
    let date: Date
    let mood: String
    let people: String
}

// دکمه‌های انتخاب حالت روحی
struct MoodButton: View {
    let emoji: String
    let mood: String
    @Binding var selectedMood: String

    var body: some View {
        Button(action: {
            selectedMood = mood
        }) {
            Text(emoji)
                .font(.largeTitle)
                .padding()
                .background(selectedMood == mood ? Color.yellow : Color.gray.opacity(0.3))
                .cornerRadius(10)
        }
    }
}

// دکمه‌های انتخاب افراد
struct PeopleButton: View {
    let label: String
    @Binding var selectedPeople: String

    var body: some View {
        Button(action: {
            selectedPeople = label
        }) {
            Text(label)
                .padding()
                .background(selectedPeople == label ? Color.blue : Color.gray.opacity(0.3))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
