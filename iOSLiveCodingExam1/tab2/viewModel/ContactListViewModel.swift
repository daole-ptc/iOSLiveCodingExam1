//
//  ContactListViewModel.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/25/21.
//

import Combine
import SwiftUI

class ContactListViewModel: ObservableObject {
    private var service = ContactListService()
    private var bag = Set<AnyCancellable>()
    
    @Published var contacts = [ContactEntity]()
    
    func fetchContacts() {
        service.getContacts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { list in
                self.contacts = list
            }).store(in: &bag)
    }
}
