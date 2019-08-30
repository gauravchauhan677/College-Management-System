//
//  CollegeListViewCell.swift
//  CollegeMangaement
//
//  Created by gaurav chauhan on 29/08/19.
//  Copyright © 2019 gaurav chauhan. All rights reserved.
//

import UIKit

class CollegeListViewCell: UITableViewCell {

    @IBOutlet var lblCollegeName: UILabel!
    
    @IBOutlet var lblCollegeCity: UILabel!
    @IBOutlet var lblCollegeUniversity: UILabel!
    
    var college: College?{
        didSet{
            lblCollegeName.text = "Name : \(college?.name ?? "")"
            lblCollegeCity.text = "City : \(college?.city ?? "")"
            lblCollegeUniversity.text = "University : \( college?.university ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
