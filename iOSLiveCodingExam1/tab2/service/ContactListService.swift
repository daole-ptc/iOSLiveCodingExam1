//
//  ContactListService.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/25/21.
//

import Combine
import RxSwift
import Foundation

class ContactListService {
    func getContacts(withSize size: Int = 5) -> Future<[ContactEntity], Error> {
        let url = URL(string: "https://randomuser.me/api/?results=\(size)")!
        return Future { promise in
            let task = URLSession.shared
                .dataTask(with: url) { data, _, error in
                    if error == nil {
                        if let json = try! JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String: Any] {
                            let list = json["results"] as! [Dictionary<String, Any>]
                            let contacts = list.map { ContactEntity(dictionary: $0) }
                            print("CONTACTS = \(contacts.count)")
                            promise(.success(contacts))
                        }
                        promise(.success([ContactEntity]()))
                    } else {
                        promise(.failure(error!))
                    }
                }
            task.resume()
        }
    }
    
    func rxGetContacts(withSize size: Int = 5) -> Observable<[ContactEntity]> {
        let url = URL(string: "https://randomuser.me/api/?results=\(size)")!
        return Observable.create { observer in
            let task = URLSession.shared
                .dataTask(with: url) { data, _, error in
                    if error == nil {
                        if let json = try! JSONSerialization.jsonObject(with: data ?? Data(), options: []) as? [String: Any] {
                            let list = json["results"] as! [Dictionary<String, Any>]
                            let contacts = list.map { ContactEntity(dictionary: $0) }
                            print("CONTACTS = \(contacts.count)")
                            observer.onNext(contacts)
                        }
                        observer.onNext([ContactEntity]())
                    } else {
                        observer.onError(error!)
                    }
                }
            task.resume()
            return Disposables.create()
        }
    }
}
