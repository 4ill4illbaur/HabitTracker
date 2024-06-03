//
//  UserSettings.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import Foundation

struct UserSettings: Codable {
    var completedHabitsCount: Int
    var totalHabitsCount: Int
    
    init(completedHabitsCount: Int, totalHabitsCount: Int) {
        self.completedHabitsCount = completedHabitsCount
        self.totalHabitsCount = totalHabitsCount
    }
}
