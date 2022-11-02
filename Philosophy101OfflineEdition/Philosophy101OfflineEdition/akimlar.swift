//
//  akimlar.swift
//  Philosophy101OfflineEdition
//
//  Created by Ibrahim Gok on 2.11.2022.
//

import UIKit

class akimlar: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var akim = [String]()
    var akimexp = [String]()
    
    var selectedAkim = String()
    var selectedAkimExp = String()
   
    
    var datas = loadCSV(from: "akimdata")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        if datas.count > 0 {
            
            for data in datas {
                
                if let chAkim = String?(data.akimName) {
                    self.akim.append(chAkim)
                }
                
                if let chAkimExp = String?(data.akimDes) {
                    self.akimexp.append(chAkimExp)
                    
                }
                
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return akim.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = akim[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAkimDetailsVC" {
            let destinationVC = segue.destination as! akimDetailVC
            destinationVC.ideaName = selectedAkim
            destinationVC.ideaExp = selectedAkimExp
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAkim = akim[indexPath.row]
        selectedAkimExp = akimexp[indexPath.row]
        performSegue(withIdentifier: "toAkimDetailsVC", sender: nil)
    }
    

   

}
