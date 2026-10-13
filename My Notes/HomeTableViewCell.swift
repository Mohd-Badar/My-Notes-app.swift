//
//  HomeTableViewCell.swift
//  My Notes
//
//  Created by Mohd Badar on 13/07/26.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialise code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
