//
//  ContentView.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isAddingNewHabit = false // Добавить состояние для отслеживания отображения модального окна
    @State private var isShowingStats = false // Добавить состояние для отслеживания отображения экрана статистики
    @State private var habits: [Habit] = [ // Пример массива для хранения привычек
    ]
    @StateObject private var statisticsViewModel = StatisticsViewModel(habits: [])
    @ObservedObject private var habitListViewModel = HabitListViewModel()
    
    func deleteHabits(at offsets: IndexSet) {
        guard let index = offsets.first else { return } // Проверяем, что индекс существует
        
        let removedHabit = habitListViewModel.habits[index] // Получаем удаляемый элемент по индексу
        self.habitListViewModel.deleteHabit(removedHabit) // Удаляем привычку из habitListViewModel
        habits.remove(atOffsets: offsets) // Удаляем привычку из массива
    }

    var body: some View {
        NavigationView {
            VStack {
                Text(formattedDate)
                          .font(.headline)
                          .padding(.bottom)

                List {
                    ForEach(Array(habitListViewModel.habits.enumerated()), id: \.element.id) { index, habit in
                        HabitRow(habit: habit, staticModel: statisticsViewModel)
                            
                    }
                    .onDelete { indexSet in
                        deleteHabits(at: indexSet)
                    }
                }
                .navigationTitle("Мои привычки")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isAddingNewHabit = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isShowingStats = true
                        }) {
                            Image(systemName: "chart.bar.fill")
                                .font(.largeTitle)
                        }
                    }
                }
            }
            .onAppear {
                    habitListViewModel.loadHabits() // Загрузить привычки при появлении ContentView
                  }
            .sheet(isPresented: $isAddingNewHabit) {
                AddHabitView(viewModel: habitListViewModel, habits: $habits) // Use the existing habitListViewModel
            }
            .sheet(isPresented: $isShowingStats) {
                StatisticsView(viewModel: statisticsViewModel, habits: habits) // Pass habits directly
            }
        }
          var formattedDate: String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd MMMM yyyy" // Настройте формат по своему усмотрению
           return dateFormatter.string(from: Date())
         }
    }
}



#Preview {
    ContentView()
}
