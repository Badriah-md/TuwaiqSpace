//
//  chatsTableView.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 25/09/1442 AH.
//

import UIKit
class Chats{
    var chatName : String?
    var chatPhoto: String?
    
    init(chatName:String,chatPhoto:String) {
        self.chatName = chatName
        self.chatPhoto = chatPhoto
    }
}

class chatsTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var lists = [Chats]()
    @IBOutlet weak var chatsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        
        lists.append(Chats(chatName: "Swift group", chatPhoto: "swift"))
        lists.append(Chats(chatName: "javascript group", chatPhoto: "javascript"))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ChatsTableViewCell
        cell.chatName.text = lists[indexPath.row].chatName
        cell.chatPhoto.image = UIImage(named: lists[indexPath.row].chatPhoto!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "chats", sender: nil)
        
       
    }
}
