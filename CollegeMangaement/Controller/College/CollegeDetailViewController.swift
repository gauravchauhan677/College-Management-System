//
//  CollegeDetailViewController.swift
//  CollegeMangaement
//
//  Created by gaurav chauhan on 29/08/19.
//  Copyright © 2019 gaurav chauhan. All rights reserved.
//

import UIKit

class CollegeDetailViewController: UITableViewController {

    @IBOutlet var lblCollegeName: UILabel!
    @IBOutlet var lblCollegeAddress: UILabel!
    @IBOutlet var lblCollegeCity: UILabel!
    @IBOutlet var lblCollegeUniversity: UILabel!
    
    var collegeDetail: College?
    var indexRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        
        lblCollegeName.text = collegeDetail?.name ?? ""
        lblCollegeCity.text = collegeDetail?.city ?? ""
        lblCollegeUniversity.text = collegeDetail?.university ?? ""
        lblCollegeAddress.text = collegeDetail?.address ?? ""
    }
    
    @IBAction func btnEditClick(_ sender: UIBarButtonItem) {
        
        let formVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetails = collegeDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: false)
    }
    
}
