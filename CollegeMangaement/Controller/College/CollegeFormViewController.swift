//
//  CollegeFormViewController.swift
//  CollegeMangaement
//
//  Created by gaurav chauhan on 29/08/19.
//  Copyright © 2019 gaurav chauhan. All rights reserved.
//

import UIKit

class CollegeFormViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeAddress: UITextField!
    
    @IBOutlet var txtCollegeUniversity: UITextField!
    @IBOutlet var txtCollegeCity: UITextField!
    
    @IBOutlet var btnSave: UIButton!
    var isUpdate = false
    var indexRow = Int()
    var collegeDetails: College?
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtCollegeName.text = collegeDetails?.name
        self.txtCollegeCity.text = collegeDetails?.city
        self.txtCollegeAddress.text = collegeDetails?.address
        self.txtCollegeUniversity.text = collegeDetails?.university

    }
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate{
            btnSave.setTitle("Update", for: .normal)
        }else{
            btnSave.setTitle("Save", for: .normal)
        }
    }
    
    
}
// MARK: Actions
extension CollegeFormViewController{
    
    @IBAction func btnCollegeSaveClick(_ sender: UIButton) {
        self.collegeSaveData()
        self.navigationController?.popViewController(animated: true)
    }
    
}
// MARK: Methods
extension CollegeFormViewController{
    
    func collegeSaveData(){
        guard let collegeName = txtCollegeName.text else { return }
        guard let collegeAddress = txtCollegeAddress.text else { return }
        guard let collegeCity = txtCollegeCity.text else { return }
        guard let collegeUniversity = txtCollegeUniversity.text else { return }
        
        let collegeDict = [
            
            "collegeName": collegeName,
            "collegeAddress": collegeAddress,
            "collegeCity": collegeCity,
            "collegeUniversity": collegeUniversity
        
         ]
        
        if isUpdate{
            DatabaseHelper.shareInstance.editCollegeData(collegeDict: collegeDict, index: indexRow)
            isUpdate = false
            
        }else{
            DatabaseHelper.shareInstance.saveCollegeData(collegeDict: collegeDict)
        }
        
        
    }
}


