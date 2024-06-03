//
//  HabitLogView.swift
//  HabitTracker
//
//  Created by Бауржан Еркен on 10.05.2024.
//

//import SwiftUI
//
//struct HabitLogView: View {
//    @ObservedObject var viewModel: HabitLogViewModel
//    
//    var body: some View {
//        VStack {
//            Text(viewModel.habit.name)
//                .font(.largeTitle)
//            
//            List {
//                ForEach(viewModel.logs) { log in
//                    HabitLogRow(viewModel: viewModel, log: log) // Передайте реальный экземпляр 'viewModel'
//                }
//            }
//            .navigationTitle("Журнал привычки")
//            .toolbar {
//                Button(action: {
//                    viewModel.addLog()
//                }) {
//                    Image(systemName: "plus")
//                }
//            }
//        }
//    }
//}
//
//struct HabitLogRow: View {
//    @ObservedObject var viewModel: HabitLogViewModel
//        let log: HabitLog
//
//        var body: some View {
//            HStack {
//                Button(action: {
//                    viewModel.toggleCompletion(for: log)
//                }) {
//                    Image(systemName: log.isCompleted ? "checkmark.circle.fill" : "circle")
//                }
//                Text(log.date, style: .date)
//                Spacer()
//        }
//    }
//}
