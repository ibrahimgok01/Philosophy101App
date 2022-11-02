//
//  phidetailVC.swift
//  Philosophy101OfflineEdition
//
//  Created by Ibrahim Gok on 2.11.2022.
//

import UIKit

class phidetailVC: UIViewController {
    
    
    @IBOutlet weak var grey1View: UIView!
    @IBOutlet weak var ArticleLabel: UILabel!
    @IBOutlet weak var AkimLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var grey2View: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var CHphiName = String()
    var CHphiDates = String()
    var CHphiType = String()
    var CHphiAkim = String()
    var CHphiArticle = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        grey1View.layer.cornerRadius = 10
        grey2View.layer.cornerRadius = 10
        nameLabel.text = CHphiName
        ArticleLabel.text = CHphiArticle
        AkimLabel.text = CHphiAkim
        dateLabel.text = CHphiDates
        typeLabel.text = CHphiType

    }
    

   
}
