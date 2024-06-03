//
//  HabitListViewModel.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import Foundation
import Combine

class HabitListViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    private let userDefaultsStorage = UserDefaultsStorage()
    
    init() {
        loadHabits()
    }
    
    func loadHabits() {
        habits = UserDefaultsStorage.loadHabits()
    }
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
        UserDefaultsStorage.saveHabits(habits) // Сохраняем обновленный список привычек
        objectWillChange.send() // Уведомить представление об изменении
    }
    
    func deleteHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits.remove(at: index)
            UserDefaultsStorage.saveHabits(habits) // Сохраняем обновленный список привычек
            objectWillChange.send() // Уведомить представление об изменении
        }
    }
    
    func updateHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index] = habit
            UserDefaultsStorage.saveHabits(habits) // Сохраняем обновленный список привычек
            objectWillChange.send() // Уведомить представление об изменении
        }
    }
}
