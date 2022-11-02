//
//  akimDetailVC.swift
//  Philosophy101OfflineEdition
//
//  Created by Ibrahim Gok on 2.11.2022.
//

import UIKit
import CloudKit

class akimDetailVC: UIViewController {

    @IBOutlet weak var akimExp: UILabel!
    @IBOutlet weak var akimname: UILabel!
    
    
    var ideaName = String()
    var ideaExp = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        akimname.text = ideaName
        akimExp.text = ideaExp
       
        
    }
    

    
}
