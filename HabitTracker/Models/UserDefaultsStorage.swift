//
//  UserDefaultsStorage.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//


import Foundation

class UserDefaultsStorage {
    private static let key = "HabitTrackerData"

    static func loadUserSettings() -> UserSettings {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return UserSettings(completedHabitsCount: 0, totalHabitsCount: 0)
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(UserSettings.self, from: data)
        } catch {
            print("Failed to load UserSettings: \(error)")
            return UserSettings(completedHabitsCount: 0, totalHabitsCount: 0)
        }
    }

    static func saveUserSettings(_ settings: UserSettings) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Failed to save UserSettings: \(error)")
        }
    }
    

    static func loadHabits() -> [Habit] {
        guard let data = UserDefaults.standard.data(forKey: "Habits") else {
                return []
            }
        
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Habit].self, from: data).filter { !$0.isDeleted }
            } catch {
                print("Failed to load Habits: \(error)")
                return []
        }
    }

    static func saveHabits(_ habits: [Habit]) {
        do {
                let encoder = JSONEncoder()
                let filteredHabits = habits.filter { !$0.isDeleted }
                let data = try encoder.encode(filteredHabits)
                UserDefaults.standard.set(data, forKey: "Habits")
            } catch {
                print("Failed to save Habits: \(error)")
        }
    }
}
