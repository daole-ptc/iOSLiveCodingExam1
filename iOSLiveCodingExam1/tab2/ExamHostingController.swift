//
//  ExamHostingController.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/25/21.
//

import SwiftUI

class ExamHostingController: UIHostingController<AnyView> {
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: AnyView(ContactListView()))
    }
}
