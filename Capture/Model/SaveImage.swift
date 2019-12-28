////
////  PersonModel.swift
////  Capture
////
////  Created by Jerrod Kim on 12/12/19.
////  Copyright © 2019 Jerrod Kim. All rights reserved.
////
//
//  Jerrod Kim
//  jiryangk@usc.edu
//import Foundation
//
//
//class SaveImage: NSObject {
//    public static let shared = SaveImage()
//    var filepath:String
//    var num: Int
//    //var imagesArray = [Int]()
//    
//    override init () {
//       
//        filepath = ""
//        let manager = FileManager.default
//        if let url = manager.urls(for: .documentDirectory,
//                                  in: .userDomainMask).first {
//            filepath = url.appendingPathComponent("image.plist").path
//            print("filepath=\(filepath)")
//        }
//
//        if manager.fileExists(atPath: filepath) {
//            if let n = NSInteger(filepath) {
//                num = n
//        }
//    }
//    }
//    
////    func Append (i: Int) {
////        imagesArray.append(i)
////    }
//    
//    func inc (){
//        num += 1
//        save()
//    }
//    private func save() {
//        // write to the file system
//        (num as NSArray).write(toFile: filepath, atomically: true)
//        
//        }
//    
//}
