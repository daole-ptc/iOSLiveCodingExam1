//
//  contact.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/18/21.
//

import Foundation

class ContactEntity {
    var firstName: String
    var lastName: String
    
    var street: String
    var city: String
    var state: String
    var country: String
    
    var birthday: Date?
    
    var avatar: String
    var nationality: String
    
    init(dictionary dic: Dictionary<String, Any>) {
        let nameDic = dic["name"] as! Dictionary<String, Any>
        self.firstName = nameDic["first"] as! String
        self.lastName = nameDic["last"] as! String
        
        let locationDic = dic["location"] as! Dictionary<String, Any>
        let streetDic = locationDic["street"] as! Dictionary<String, Any>
        self.street = "\(streetDic["number"] as! Int) \(streetDic["name"] as! String)"
        self.city = locationDic["city"] as! String
        self.state = locationDic["state"] as! String
        self.country = locationDic["country"] as! String
        
        let dobDic = dic["dob"] as! Dictionary<String, Any>
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        self.birthday = dateFormatter.date(from: dobDic["date"] as! String)
        
        let pictureDic = dic["picture"] as! Dictionary<String, Any>
        self.avatar = pictureDic["medium"] as! String
        
        self.nationality = dic["nat"] as! String
    }
}
