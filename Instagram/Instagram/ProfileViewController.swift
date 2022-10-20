//
//  ProfileViewController.swift
//  Instagram
//
//  Created by rodeo station on 10/18/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    //let refreshControl=UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureView.layer.cornerRadius=pictureView.frame.size.width/2
        pictureView.layer.masksToBounds=true
        getUserinfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPicture(PFUser.current()!)
    }
    
    func getUserinfo(){
        let user=PFUser.current()!
        usernameLabel.text=user.username
        
        getPicture(user)
   
    }
    func getPicture(_ user:PFUser){
        if (user["picture"] != nil){
            let imageFile=user["picture"] as! PFFileObject
            let urlString=imageFile.url!
            let url=URL(string: urlString)!
            pictureView.af.setImage(withURL: url)
        }
    }
  
    

    

}
