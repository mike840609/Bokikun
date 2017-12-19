//
//  NewRecordViewController.swift
//  Bokikun
//
//  Created by 蔡鈞 on 19/12/2017.
//  Copyright © 2017 蔡鈞. All rights reserved.
//

import UIKit

class NewRecordViewController: UIViewController,UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
    }
    
    
    
    
    
    
    
    
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }

}
