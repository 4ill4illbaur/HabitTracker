//
//  StatisticsView.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var viewModel: StatisticsViewModel
    let habits: [Habit]
    
    var body: some View {
        VStack {
            Text("Статистика")
                .font(.largeTitle)
            
            Text("Выполнено:")
            Spacer()
            Text("\(viewModel.completedHabitsCount)")
            
            if !viewModel.completedHabitNames.isEmpty {
                Text("Завершенные привычки:")
                List {
                    ForEach(viewModel.completedHabitNames, id: \.self) { name in
                        Text(name)
                    }
                }
            }
        }
    }
}
