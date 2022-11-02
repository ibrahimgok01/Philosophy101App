//
//  PhiVC.swift
//  Philosophy101OfflineEdition
//
//  Created by Ibrahim Gok on 2.11.2022.
//

import UIKit

class PhiVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    var datas = loadCSV2(from: "phidata")
    
    var phiName = [String]()
    var phiDates = [String]()
    var phiType = [String]()
    var phiAkim = [String]()
    var phiArticle = [String]()
    
    var SelectedphiName = String()
    var SelectedphiDates = String()
    var SelectedphiType = String()
    var SelectedphiAkim = String()
    var SelectedphiArticle = String()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        tableView.delegate = self
        tableView.dataSource = self
       
        
        if datas.count > 0 {
            for data in datas {
                if let chphiName = String?(data.phiName) {
                    self.phiName.append(chphiName)
                }
                if let chphiDates = String?(data.phiDate) {
                    self.phiDates.append(chphiDates)
                }
                if let chphiType = String?(data.phiType) {
                    self.phiType.append(chphiType)
                }
                if let chphiAkim = String?(data.phiAkim) {
                    self.phiAkim.append(chphiAkim)
                }
                if let chphiArticle = String?(data.phiDes) {
                    self.phiArticle.append(chphiArticle)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phiName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = phiName[indexPath.row]
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhiDetailVC" {
            let destinationVC = segue.destination as! phidetailVC
            destinationVC.CHphiName = SelectedphiName
            destinationVC.CHphiAkim = SelectedphiAkim
            destinationVC.CHphiType = SelectedphiType
            destinationVC.CHphiDates = SelectedphiDates
            destinationVC.CHphiArticle = SelectedphiArticle
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedphiName = phiName[indexPath.row]
        SelectedphiAkim = phiAkim[indexPath.row]
        SelectedphiType = phiType[indexPath.row]
        SelectedphiDates = phiDates[indexPath.row]
        SelectedphiArticle = phiArticle[indexPath.row]
        performSegue(withIdentifier: "toPhiDetailVC", sender: nil)
    }
    
    
    
}
