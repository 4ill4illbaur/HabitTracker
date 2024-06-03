//
//  HabitLogViewModel.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

//import Foundation
//import Combine
//
//class HabitLogViewModel: ObservableObject {
//    @Published var habit: Habit
//    @Published var logs: [HabitLog] = []
//    
//    private let userDefaultsStorage = UserDefaultsStorage()
//    
//    private let habitListViewModel: HabitListViewModel // Новое свойство
//    
//    init(habit: Habit, habitListViewModel: HabitListViewModel) {
//        self.habit = habit
//        self.habitListViewModel = habitListViewModel // Сохраняем ссылку на habitListViewModel
//        loadLogs()
//    }
//    
//    func loadLogs() {
//        logs = UserDefaultsStorage.loadHabitLogs(forHabit: habit)
//    }
//    
//    func addLog() {
//        let log = HabitLog(id: UUID(), habitID: habit.id, date: Date())
//        logs.append(log)
//        UserDefaultsStorage.saveHabitLogs(logs, forHabit: habit)
//    }
//    
//    func deleteLog(_ log: HabitLog) {
//        if let index = logs.firstIndex(where: { $0.id == log.id }) {
//            logs.remove(at: index)
//            UserDefaultsStorage.saveHabitLogs(logs, forHabit: habit)
//        }
//    }
//    
//    func toggleCompletion(for log: HabitLog) {
//        if let index = logs.firstIndex(where: { $0.id == log.id }) {
//            logs[index].isCompleted.toggle()
//            UserDefaultsStorage.saveHabitLogs(logs, forHabit: habit)
//            
//            // Обновляем состояние isCompleted у привычки в HabitListViewModel
//            if let habitIndex = habitListViewModel.habits.firstIndex(where: { $0.id == habit.id }) {
//                habitListViewModel.habits[habitIndex].isCompleted = logs.contains { $0.isCompleted }
//                UserDefaultsStorage.saveHabits(habitListViewModel.habits) // Сохраняем обновленный список привычек
//            }
//        }
//    }
//}
