//
//  Habit.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    let name: String
    let reminderTime: Date?
    // Добавляем новое свойство
    var isCompleted: Bool = false // По умолчанию false
    var isDeleted: Bool = false
}
