//
//  StatisticsViewModel.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import Foundation
import Combine

class StatisticsViewModel: ObservableObject {
    @Published var completedHabitsCount: Int = 0
    @Published var totalHabitsCount: Int = 0
    @Published var habits: [Habit]
    @Published var completedHabitNames: [String] = []
    private let userDefaultsStorage = UserDefaultsStorage()
    
    init(habits: [Habit]) {
        self.habits = habits
        // ... обновить статистику на основе habits ...
    }
    
    func loadStatistics() {
        let settings = UserDefaultsStorage.loadUserSettings()
        completedHabitsCount = settings.completedHabitsCount
        totalHabitsCount = settings.totalHabitsCount
    }
    
    func updateStatistics(habit: Habit, isCompleted: Bool) {
        let delta = isCompleted ? 1 : -1
        completedHabitsCount += delta
        totalHabitsCount += (habit.isCompleted ? -1 : 1)
        UserDefaultsStorage.saveUserSettings(UserSettings(completedHabitsCount: completedHabitsCount, totalHabitsCount: totalHabitsCount))
        
        if isCompleted {
            completedHabitNames.append(habit.name)
        } else {
            if let index = completedHabitNames.firstIndex(where: { $0 == habit.name }) {
                completedHabitNames.remove(at: index)
            }
        }
    }
}
