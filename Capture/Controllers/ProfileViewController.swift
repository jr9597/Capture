//
//  ProfileViewController.swift
//  Capture
//
//  Jerrod Kim
//  jiryangk@usc.edu
//  Created by Jerrod Kim on 12/12/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//

import UIKit
import FirebaseStorage


class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate{
    
    var model = PersonModel.shared
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var star: UILabel!
    
    @IBOutlet weak var jobTF: UITextField!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self as? UITextViewDelegate
        star.text = ""
        jobTF.delegate = self as? UITextFieldDelegate
        
        //setting segmented control at 0 so that i only have to set it once.
        segmentedControl.selectedSegmentIndex = 0
        profileImage.makeRounded()
        
        //segmented control setting needed only once here
        if let thatval = model.Dict["daily"] {
            textView.text = thatval
        }
        
        if let thisVal = model.Dict["job"] {
            jobLabel.text = thisVal
            
        }
        
        
        // Retreiving the profile pic
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("image")
        
        // the size should not be small here. causes an error
        imagesRef.getData(maxSize: 1 * 1600 * 1600) { data, error in
            if let err = error {
                // Uh-oh, an error occurred!
                print(err.localizedDescription)
            } else {
                // Data is returned
                let image = UIImage(data: data!)
                self.profileImage.image = image
            }
        }
        
    }
    
    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        
        if segmentedControl.selectedSegmentIndex == 0  {
            if let thatval = model.Dict["daily"] {
                textView.text = thatval
            }
        }
        else if segmentedControl.selectedSegmentIndex == 1  {
            if let disVal = model.Dict["weekly"]{
                textView.text = disVal
            }
        }
        else if segmentedControl.selectedSegmentIndex == 2 {
            if let datVal = model.Dict["monthly"]{
                textView.text = datVal
            }
        }
    }
    
    
    
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        // set properties
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image", "public.movie"]
        imagePicker.sourceType = .photoLibrary
        // present imagePicker
        present(imagePicker, animated: true, completion: nil)
    }
    
    //everthing's saved
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if let thisText = jobTF.text {
            if thisText == "" {
                
            }
            else {
                model.insert(job: thisText, daily: "", weekly: "", monthly: "")
                jobTF.text = ""
                jobLabel.text = thisText
            }
        }
        else {
            
        }
        if segmentedControl.selectedSegmentIndex == 0 {
            if let thisText = textView.text {
                if thisText == "" {
                    
                }else {
                    
                    model.insert(job: "", daily: thisText, weekly: "", monthly: "")
                }
            }
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            if let thisText = textView.text {
                if thisText == "" {
                    
                }else {
                    model.insert(job: "", daily: "", weekly: thisText, monthly: "")
                }
            }
        }
        else if segmentedControl.selectedSegmentIndex == 2 {
            if let thisText = textView.text {
                if thisText == "" {
                    
                }else {
                    model.insert(job: "", daily: "", weekly: "", monthly: thisText)
                }
            }
        }
        
        
        
        let storage = Storage.storage()
        
        // the images are saved alongside.
        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("image")
        //let imageName = UUID().uuidString
        //let imageRef =
        //let data = Data()
        if let thisImage = profileImage.image{
            if let thisData = thisImage.jpegData(compressionQuality: 1.0){
                _ = imagesRef.putData(thisData, metadata: nil) { (metadata, error) in
                    guard metadata != nil else {
                        // Uh-oh, an error occurred!
                        return
                    }
                    
                    // Metadata contains file metadata such as size, content-type.
                    //let size = metadata.size
                    // You can also access to download URL after upload.
//                    imagesRef.downloadURL { (url, error) in
//                        guard let downloadURL = url else {
//                            // Uh-oh, an error occurred!
//                            return
//                        }
//                    }
                    
                }
            }
        }
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage
        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        // do something interesting here!
        profileImage.image = newImage
        //uploadButton.alpha = 0
        picker.dismiss(animated: true)
    }
    
    @IBAction func tappedBackground(_ sender: UITapGestureRecognizer) {
        textView.resignFirstResponder()
        jobTF.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        jobTF.resignFirstResponder()
        return true
    }
    //    func imagePickerController(_ picker: UIImagePickerController,
    //                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //        profileImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    //        picker.dismiss(animated:true,completion:nil)
    //    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
