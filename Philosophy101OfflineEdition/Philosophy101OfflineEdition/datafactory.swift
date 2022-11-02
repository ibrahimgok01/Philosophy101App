//
//  datafactory.swift
//  Philosophy101OfflineEdition
//
//  Created by Ibrahim Gok on 2.11.2022.
//

import Foundation
import UIKit


struct phi_data: Identifiable {

    var id : String = ""
    var akimName : String = ""
    var akimDes : String = ""
    
    
    init(raw: [String]) {
        
        id = raw[0]
        akimName = raw[1]
        akimDes = raw[2]
        
        
    }
}



func loadCSV(from csvName: String) -> [phi_data] {
    var csvToStruct = [phi_data]()
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    var data = ""
    
    do {
      data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return[]
    }
    
    var rows = data.components(separatedBy: "\n")
    
    let columnCount = rows.first?.components(separatedBy: ";").count
    rows.removeFirst()
    
    for row in rows {
        let csvColumns = row.components(separatedBy: ";")
        if csvColumns.count == columnCount {
        let DataStruct = phi_data.init(raw: csvColumns)
        csvToStruct.append(DataStruct)
        }
    }
    return csvToStruct
}
