//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import SwiftUI

struct HabitListView: View {
    @ObservedObject var viewModel: HabitListViewModel // Use the injected instance
    
    var body: some View {
        NavigationView {
            List {
            }
            .navigationTitle("Привычки")
            .toolbar {
                Button(action: {
                    viewModel.addHabit(Habit(id: UUID(), name: "Новая привычка",  reminderTime: nil))
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct HabitRow: View {
    let habit: Habit
    let staticModel: StatisticsViewModel?
    @State private var isSelected = false
    
    var body: some View {
        HStack {
            Text(habit.name)
            Spacer()
            Button(action: {
                isSelected.toggle()
                //
                staticModel?.updateStatistics(habit: habit, isCompleted: isSelected)
                //
            }) {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                } else {
                    Image(systemName: "circle")
                }
            }
        }
    }
}
