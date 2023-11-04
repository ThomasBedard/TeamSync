import SwiftUI

class TasksViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var searchText: String = ""
    
    var filteredTasks: [Task] {
        return tasks.filter {
            searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    // CRUD Operations
    func addTask(name: String, deadline: Date) {
        let newTask = Task(id: UUID(), name: name, deadline: deadline, isComplete: false)
        tasks.append(newTask)
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func updateTask(task: Task, name: String, deadline: Date) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            var updatedTask = tasks[index]
            updatedTask.name = name
            updatedTask.deadline = deadline
            tasks[index] = updatedTask
        }
    }

    
    func toggleComplete(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isComplete.toggle()
        }
    }
}

