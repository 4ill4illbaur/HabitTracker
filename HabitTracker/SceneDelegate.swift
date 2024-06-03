//
//  SceneDelegate.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import SwiftUI
import UserNotifications

class SceneDelegate: UIResponder, UISceneDelegate {
    var window: UIWindow?

    private func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options: UIScene.ConnectionOptions) throws {
        // Запрос разрешения на использование уведомлений
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification permissions: \(error)")
                return
            }
            
            if granted {
                print("Notification permissions granted")
            } else {
                print("Notification permissions denied")
            }
        }
    }

    func scene(_ scene: UIScene, willDisconnectFrom session: UISceneSession) {
        // Не используется
    }
}
