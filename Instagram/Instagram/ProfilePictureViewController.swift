//
//  ProfilePictureViewController.swift
//  Instagram
//
//  Created by rodeo station on 10/18/22.
//

import UIKit
import Parse
import AlamofireImage

class ProfilePictureViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var pictureView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //getPicture(PFUser.current()!)
    }
    

    
    func getPicture(_ user:PFUser){
        if (user["picture"] != nil){
            let imageFile=user["picture"] as! PFFileObject
            let urlString=imageFile.url!
            let url=URL(string: urlString)!
            pictureView.af.setImage(withURL: url)
        }
    }
    
    @IBAction func onUpload(_ sender: Any) {
        let user=PFUser.current()!
        let imageData=pictureView.image!.pngData()
        let file = PFFileObject(name: "profilePicture.png", data: imageData!)
        user["picture"]=file //this column has link to that table
        //user.add(file, forKey: "picture")
        user.saveInBackground{(success,error) in
            if success{
                self.navigationController?.popViewController(animated: true)
                
            }else{
                print("error!")
            }
        }
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        print("tap!")
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image=info[.editedImage] as! UIImage
        let size=CGSize(width:360,height:360)
        let scaledImage=image.af.imageAspectScaled(toFill:size)
        pictureView.image=scaledImage
        dismiss(animated: true, completion:nil)
    }
    

}
