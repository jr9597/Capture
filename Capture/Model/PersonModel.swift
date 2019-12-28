//
//  PersonModel.swift
//  Capture
//
//  Created by Jerrod Kim on 12/12/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//
//  Jerrod Kim
//  jiryangk@usc.edu

import Foundation

class PersonModel: NSObject {
    public static let shared = PersonModel()
    var filepath:String
    
    var Dict = [String:String]()
    
    override init () {
       
        filepath = ""
        let manager = FileManager.default
        if let url = manager.urls(for: .documentDirectory,
                                  in: .userDomainMask).first {
            filepath = url.appendingPathComponent("person.plist").path
            print("filepath=\(filepath)")
        }

        if manager.fileExists(atPath: filepath) {
            if let personDict = NSDictionary(contentsOfFile: filepath) {
                if let job =  personDict["job"], let daily = personDict["daily"], let weekly = personDict["weekly"], let monthly  = personDict["monthly"]
                {
                    Dict["job"] = job as? String
                    Dict["daily"] = daily as? String
                    Dict["weekly"] = weekly as? String
                    Dict["monthly"] = monthly as? String
                }
        }
    }
    }
    // because everything is brough, everything should be looked at.
    func insert(job: String, daily: String, weekly: String, monthly: String) {
        if job == "" {
            
        }
        else {
            Dict["job"] = job
        }
        if weekly == "" {
            
        }
        else {
            Dict["weekly"] = weekly
        }
        if monthly == "" {
            
        }
        else {
            Dict["monthly"] = monthly
        }
        if daily == "" {
            
        }
        else {
            Dict["daily"] = daily
        }
//        Dict["job"] = ""
//
//        Dict["daily"] = ""
//        Dict["daily"] = daily
//        Dict["weekly"] = ""
//        Dict["weekly"] = weekly
//        Dict["monthly"] = ""
//        Dict["monthly"] = monthly
//
        save()
    }
    private func save() {
        // write to the file system
        (Dict as NSDictionary).write(toFile: filepath, atomically: true)
        
        }
    
}
