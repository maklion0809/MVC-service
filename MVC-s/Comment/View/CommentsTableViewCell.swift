//
//  CommentsTableViewCell.swift
//  MVC-s
//
//  Created by Тимофей on 25.12.2020.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var label: UILabel!

    func configure(with comment: Comment){
        self.label?.text = comment.name
        self.textView?.text = comment.body
    }
    
    
}
