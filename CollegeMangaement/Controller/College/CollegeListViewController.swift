//
//  ViewController.swift
//  CollegeMangaement
//
//  Created by gaurav chauhan on 29/08/19.
//  Copyright © 2019 gaurav chauhan. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet var collegeListtblView: UITableView!
    var arrCollege = [College]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.arrCollege = DatabaseHelper.shareInstance.getAllCollegeData()
        self.collegeListtblView.reloadData()
    }

    @IBAction func btnCollegeAddClick(_ sender: UIBarButtonItem) {
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
        
    }
    
}

extension CollegeListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListViewCell", for: indexPath) as! CollegeListViewCell
        cell.college = arrCollege[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collegeDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeDetailViewController") as! CollegeDetailViewController
        collegeDetailVC.collegeDetail = arrCollege[indexPath.row]
        collegeDetailVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(collegeDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            arrCollege = DatabaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.collegeListtblView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
}

