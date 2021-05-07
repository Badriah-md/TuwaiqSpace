//
//  MainVC.swift
//  Tuwaiq Space
//
//  Created by Bdoor on 21/09/1442 AH.
//

import UIKit
import FirebaseFirestore

struct Post{
    let title:String?
    var desc:String?
    var postLink:String?
    var image:String?
    
    
}

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  
    var posts : [Post]=[]
    @IBOutlet weak var itemTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        posts.append(Post(title: "تطبيق لحساب العملات", desc: "في هذا التطبيق يتم تحويل العملات وحسابات الميزانيه", postLink: "https://github.com", image: "one"))
        posts.append(Post(title: "تطبيق المهام", desc: "تطبيق يساعد في ترتيب المهام وانجازها", postLink: "https://github.com", image: "tow"))
        posts.append(Post(title: "متجر الكتروني", desc: "تطبيق متجر الكتروني لعرض المنتجات الرقميه", postLink: "https://github.com", image: "three"))
        
       
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "itemsTableViewCell", bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: "Cell")
        itemTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! itemsTableViewCell
        cell.postLbl.text = posts[indexPath.row].title
        cell.postDesc.text = posts[indexPath.row].desc
        cell.postUrl.text = posts[indexPath.row].postLink
        cell.itemImg.image = UIImage(named: posts[indexPath.row].image!)
        
     
        return cell
    }
    
   

}
