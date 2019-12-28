//
//  TableViewController.swift
//  Capture
//  Jerrod Kim
//  jiryangk@usc.edu
//  Created by Jerrod Kim on 12/10/19.
//  Copyright © 2019 Jerrod Kim. All rights reserved.
//

import UIKit
import FirebaseStorage

class TableViewController: UITableViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var addBarButton: UIBarButtonItem!
    var imagesArray = [UIImage]()
    let storage = Storage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        // Get a reference to the storage service using the default Firebase App


        // Create a storage reference from our storage service
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
        
    }
    
    // MARK: - Table view data source

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        // set properties
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = ["public.image", "public.movie"]
        imagePicker.sourceType = .photoLibrary
        // present imagePicker
        present(imagePicker, animated: true, completion: nil)
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
        
        imagesArray.append(newImage)
        var myNum = imagesArray.count
        var myNumChar = String(myNum)
        
        let storageRef = storage.reference()
        let imagesRef = storageRef.child(myNumChar)
        let imageName = UUID().uuidString
        //let imageRef =
        let data = Data()
        
            if let thisData = newImage.jpegData(compressionQuality: 1.0){
            let uploadTask = imagesRef.putData(thisData, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            //print(metadata.localizedDescription)
            return
          }
            
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          imagesRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
              return
            }
            }
        }
            }
        
    picker.dismiss(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imagesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        
        for i in  0 ... imagesArray.count + 1 {
            
        var ha = String(i)
         let storage = Storage.storage()
         let storageRef = storage.reference()
         let imagesRef = storageRef.child("ha")
        
            
         imagesRef.getData(maxSize: 1 * 1600 * 1600) { data, error in
           if let error = error {
             // Uh-oh, an error occurred!
            print(error.localizedDescription)
           } else {
             // Data is returned
             let image = UIImage(data: data!)
            cell.imageView?.image = image
           }
         }
        }
         return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
