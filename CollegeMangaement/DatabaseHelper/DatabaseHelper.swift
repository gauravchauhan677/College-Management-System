//
//  DatabaseHelper.swift
//  CollegeMangaement
//
//  Created by gaurav chauhan on 29/08/19.
//  Copyright © 2019 gaurav chauhan. All rights reserved.
//

import UIKit
import CoreData

class DatabaseHelper: NSObject {
    
    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeData(collegeDict: [String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = collegeDict["collegeName"]
        college.address = collegeDict["collegeAddress"]
        college.city = collegeDict["collegeCity"]
        college.university = collegeDict["collegeUniversity"]
        
        do{
            try context.save()
            
        }catch let err{
            print("college save error :- \(err.localizedDescription)")
            
        }
        
        
    }
    
    func getAllCollegeData() -> [College]{
        var arrCollege = [College]()
       let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
        arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch let err{
            print("Erron in college fetch :- \(err.localizedDescription)")
        }
        return arrCollege
    }
    
    func deleteCollegeData(index: Int) -> [College]{
        var collegeData = self.getAllCollegeData()
        context.delete(collegeData[index])
        collegeData.remove(at: index)
        do{
            try context.save()
            
        }catch let err{
            print("delete college data :- \(err.localizedDescription)")
        }
        return collegeData
    }

    func editCollegeData(collegeDict: [String : String], index:Int){
        var college = self.getAllCollegeData()
        // original data
        college[index].name = collegeDict["collegeName"]  //edit data
        college[index].address = collegeDict["collegeAddress"]
        college[index].city = collegeDict["collegeCity"]
        college[index].university = collegeDict["collegeUniversity"]
        do{
            try context.save()
        }catch{
            print("Error in edit data")
        }
        
    }
}
