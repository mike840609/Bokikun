//
//  MainVC.swift
//  Bokikun
//
//  Created by 蔡鈞 on 16/12/2017.
//  Copyright © 2017 蔡鈞. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher


class MainVC: UIViewController {
    
    @IBOutlet weak var AvaImg: UIImageView!
    @IBOutlet weak var NameLbl: UILabel!
    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var UidLbl: UILabel!
    
    @IBOutlet weak var RecordTableView: UITableView!
    
    
    let data = ["1" ,"2" ,"3" ,"4" ,"5" ,"6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.setImage()
        
        RecordTableView.delegate = self
        RecordTableView.dataSource = self
    }
    
    func loadData(){
        if let currentUser = Auth.auth().currentUser {
            
            self.UidLbl.text = currentUser.uid
            
            // facebook_photo
            if let url = currentUser.photoURL{
                print(url)
                self.AvaImg.kf.setImage(with: url)
            }
            
            if let name = currentUser.displayName{
                self.NameLbl.text = name
            }
            
            if let email = currentUser.email{
                self.EmailLbl.text = email
            }
        }
    }
    
    func setImage(){
        AvaImg.layer.borderWidth = 1
        AvaImg.layer.masksToBounds = false
        AvaImg.layer.borderColor = UIColor.darkGray.cgColor
        AvaImg.layer.cornerRadius = AvaImg.frame.height/2
        AvaImg.clipsToBounds = true
    }

    
    @IBAction func handleNewRecord(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewRecordViewController") as! NewRecordViewController
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: true, completion: nil)
    }
}


extension MainVC:UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RecordTableViewCell
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

    
}
