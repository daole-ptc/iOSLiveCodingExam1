//
//  contact.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/18/21.
//

import Foundation

class Contact {
    var id: Int
    var name: String
    var avatar: String
    var company: String
    var language: String
    
    init(dictionary dic: Dictionary<String, Any>) {
        self.id = dic["id"] as! Int
        self.name = dic["name"] as! String
        self.avatar = dic["avatar"] as! String
        self.company = dic["company"] as! String
        self.language = dic["language"] as! String
    }
}
