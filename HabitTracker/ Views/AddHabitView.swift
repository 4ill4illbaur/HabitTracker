//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var description: String = ""
//    @State private var selectedFrequency: HabitFrequency = .daily
    @State private var reminderTime: Date? // Use optional Date state variable
    @ObservedObject var viewModel: HabitListViewModel
    @Binding var habits: [Habit]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $name)
                // Используйте обертку для преобразования optional Date в Binding<Date>
                DatePicker("Время напоминания", selection: Binding(get: { reminderTime ?? Date() }, set: { reminderTime = $0 }), in: Date()...)
            }
            .navigationTitle("Добавить привычку")
                .toolbar {
    ToolbarItem(placement: .navigationBarLeading) {
    Button("Отменить") {
    dismiss()
}
}
                    ToolbarItem(placement: .navigationBarTrailing) {
    Button("Добавить") {
                let newHabit = Habit(id: UUID(), name: name, reminderTime: reminderTime)
        NotificationManager.shared.scheduleNotification(for: newHabit)
                viewModel.addHabit(newHabit)
                dismiss()
}
}
}
        }
    }
}
