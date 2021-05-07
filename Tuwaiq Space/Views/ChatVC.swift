//
//  ChatVC.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 25/09/1442 AH.
//

import UIKit
import FirebaseFirestore
import Firebase

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var messageText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        chatTable.delegate = self
        chatTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var chatTable: UITableView!
    
    var messages:[Messages] = []
    var db = Firestore.firestore()
    
    
    func loadData()  {
        db.collection("Messages").order(by: "time").addSnapshotListener{ (querySnapshot, error) in
            self.messages = []
            if let snapchotDoc = querySnapshot?.documents {
                for doc in snapchotDoc{
                  let data = doc.data()
                        if let messageSender = data["sender"] as? String,
                           let messageBody = data["text"] as? String{
                            let newMessages = Messages(sender: messageSender, body: messageBody)
                            self.messages.append(newMessages)
                            DispatchQueue.main.async {
                                self.chatTable.reloadData()
                            }
                        }
                    
                }
            }
            
       
           
        }
    }

    @IBAction func sendButton(_ sender: Any) {
        if let messageTxt = messageText.text ,let messageSender = Auth.auth().currentUser?.email{
            db.collection("Messages").addDocument(data: [
                "sender":messageSender,
                "text":messageTxt,
                "time": Date().timeIntervalSince1970
            ]){(error) in
                if let err = error {
                    print(err)
                }else{
                    DispatchQueue.main.async {
                        self.messageText.text = ""
                    }
                    
                }
            }
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ChatTableVCell
        cell.messageLabel.text = messages[indexPath.row].body
        let message = messages[indexPath.row]
        if message.sender == Auth.auth().currentUser?.email{
            cell.getMessageDesign(sender: .me)
        }else{
            cell.getMessageDesign(sender: .other)
        }
        return cell
    }
}
