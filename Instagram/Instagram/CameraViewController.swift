//
//  CameraViewController.swift
//  Instagram
//
//  Created by rodeo station on 10/13/22.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var postField: UITextField!
    
    @IBAction func onPostButton(_ sender: Any) {
        let post=PFObject(className: "Posts")
        post["caption"]=postField.text!
        post["author"]=PFUser.current()!
        let imageData=imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)//image stored in another table
        post["image"]=file //this column has link to that table
        post.saveInBackground{(success,error) in
            if success{
                self.dismiss(animated: true,completion: nil)
                print("saved!")
            }else{
                print("error!")
            }
        }
    }
    @IBAction func onCameraButton(_ sender: Any) {
        print("tap")
        let picker=UIImagePickerController()
        picker.delegate=self
        picker.allowsEditing=true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true,completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image=info[.editedImage] as! UIImage
        let size=CGSize(width:300,height:300)
        let scaledImage=image.af.imageAspectScaled(toFill:size)
        imageView.image=scaledImage
        dismiss(animated: true, completion:nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
