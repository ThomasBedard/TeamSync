import SwiftUI

class DirectoryViewModel: ObservableObject {
    @Published var contacts: [Contact] = [
        // Mock data
        Contact(name: "John Doe", phoneNumber: "123-456-7890", email: "john@example.com"),
        Contact(name: "Steve Smith", phoneNumber: "123-456-7890", email: "steve@example.com")
    ]

    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }

    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }

    func updateContact(_ contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index] = contact
        }
    }
}

