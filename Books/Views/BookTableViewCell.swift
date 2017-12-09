//
//  BookTableViewCell.swift
//  Books
//
//  Created by Vadim on 12/8/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

import UIKit
import AlamofireImage

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    func configure(for book: Book) {
        thumbnail.af_setImage(withURL: book.thumbnailUrl)
        titleLabel.text = book.title
        authorsLabel.text = book.authors.joined(separator: "\n")
        publishedDateLabel.text = "Published: \(book.publishedDate)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
