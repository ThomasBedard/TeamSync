
import SwiftUI

struct ContactDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var contact: Contact
    @ObservedObject var viewModel: DirectoryViewModel
    var isNewContact: Bool = false
    
    @State private var name: String
    @State private var phoneNumber: String
    @State private var email: String
    

    init(contact: Contact, viewModel: DirectoryViewModel, isNewContact: Bool = false) {
        self.contact = contact
        self.viewModel = viewModel
        self.isNewContact = isNewContact
        _name = State(initialValue: contact.name)
        _phoneNumber = State(initialValue: contact.phoneNumber)
        _email = State(initialValue: contact.email)
    }

    var body: some View {
        Form {
            Section(header: Text("Contact Info")) {
                TextField("Name", text: $name)
                TextField("Phone", text: $phoneNumber)
                TextField("Email", text: $email)
            }

            Section {
                Button(isNewContact ? "Add Contact" : "Update Contact") {
                    let updatedContact = Contact(id: contact.id, name: name, phoneNumber: phoneNumber, email: email)
                    if isNewContact {
                        viewModel.addContact(updatedContact)
                    } else {
                        viewModel.updateContact(updatedContact)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationBarTitle(isNewContact ? "New Contact" : "Edit Contact")
    }
}

struct DirectoryView: View {
    @StateObject private var viewModel = DirectoryViewModel()
    @State private var showingAddContact = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.contacts) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact, viewModel: viewModel)) {
                        Text(contact.name)
                    }
                }
                .onDelete(perform: viewModel.deleteContact)
            }
            .navigationTitle("Directory")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddContact = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddContact) {
                // Pass a blank new contact to be edited in the ContactDetailView
                ContactDetailView(contact: Contact(name: "", phoneNumber: "", email: ""), viewModel: viewModel, isNewContact: true)
            }
        }
    }
}
