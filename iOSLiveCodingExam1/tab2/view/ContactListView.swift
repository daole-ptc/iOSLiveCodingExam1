//
//  ContactListView.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/25/21.
//

import SwiftUI
import Combine

struct ContactListView: View {
    @ObservedObject var viewModel = ContactListViewModel()
    
    var body: some View {
        Group {
            Text("Do Exam Here")
            Text("TOTAL = \(viewModel.contacts.count)")
        }
        .onAppear {
            viewModel.fetchContacts()
        }
    }
}

struct ContactListView_Preview: PreviewProvider {
    static var previews: some View {
        return ContactListView()
            .frame(width: 375)
    }
}
