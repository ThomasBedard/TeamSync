
import SwiftUI




struct EditTaskView: View {
    var task: Task
    @ObservedObject var viewModel: TasksViewModel
    @State var editedName: String
    @State var editedDeadline: Date
    
    init(task: Task, viewModel: TasksViewModel) {
        self.task = task
        self.viewModel = viewModel
        self._editedName = State(initialValue: task.name)
        self._editedDeadline = State(initialValue: task.deadline)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Edit Task")
                .font(.title)
                .fontWeight(.semibold)
            
            TextField("Task name", text: $editedName)
                .padding()
                .background(Color.gray.opacity(0.1))   
                .cornerRadius(10)
            
            DatePicker("Deadline", selection: $editedDeadline, displayedComponents: [.date])
                .padding(.horizontal)
            
            Button("Save Changes") {
                viewModel.updateTask(task: task, name: editedName, deadline: editedDeadline)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}


struct TasksView: View {
    @StateObject var viewModel = TasksViewModel()
    @State var newTaskName: String = ""
    @State var newTaskDeadline: Date = Date()
    @State var selectedTask: Task? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                SearchBar(text: $viewModel.searchText)
                    .padding(.vertical)
                // Add Task Form
                HStack {
                    TextField("Task name", text: $newTaskName)
                    DatePicker("", selection: $newTaskDeadline, displayedComponents: [.date])
                    Button("Add") {
                        viewModel.addTask(name: newTaskName, deadline: newTaskDeadline)
                        newTaskName = ""
                        newTaskDeadline = Date()
                    }
                    .padding(5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Tasks List
                List {
                    ForEach(viewModel.filteredTasks) { task in
                        HStack {
                            Text(task.name)
                            Spacer()
                            Text(dateToString(task.deadline))
                            
                            Button("") {
                                selectedTask = task
                            }
                            .padding(.horizontal)
                            
                        }
                        .onTapGesture {
                            viewModel.toggleComplete(task: task)
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
                
            }
            .sheet(item: $selectedTask) { task in
                EditTaskView(task: task, viewModel: viewModel)
            }
            .navigationTitle("Tasks")
        }
    }
    func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search tasks", text: $text)
                .padding(.leading)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        
        .padding(.horizontal)
    }
}




