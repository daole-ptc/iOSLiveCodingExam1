//
//  SampleViewController.swift
//  iOSLiveCodingExam1
//
//  Created by @camapblue on 9/18/21.
//

import UIKit

class ContactItemCell: UITableViewCell {
    @IBOutlet weak var ibAvatar: UIImageView!
    @IBOutlet weak var ibName: UILabel!
    @IBOutlet weak var ibCompany: UILabel!
    
    func updateView(_ contact: Contact) {
        let url = URL(string: contact.avatar)
        let data = try? Data(contentsOf: url!)
        ibAvatar.image = UIImage(data: data!)
        ibName.text = contact.name
        ibCompany.text = contact.company
    }
}

class SampleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ibContactTableView: UITableView!
    
    var contacts: [Contact] = []
    
    override func viewDidLoad() {

    }
    
    @IBAction func onStart(button: UIBarButtonItem) {
        if let path = Bundle.main.path(forResource: "contacts", ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let contactArray = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [Dictionary<String, Any>]
            for dic in contactArray {
                let contact = Contact(dictionary: dic)
                contacts.append(contact)
            }
            ibContactTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell.contactItem", for: indexPath) as! ContactItemCell
        
        let contact = contacts[indexPath.row]
        cell.updateView(contact);
        
        return cell
    }
}
