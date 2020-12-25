//
//  ViewController.swift
//  MVC-s
//
//  Created by Тимофей on 25.12.2020.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentNetworkService.getComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
        }
    }

}
extension CommentsViewController: UITableViewDelegate{
    
}
extension CommentsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
}
