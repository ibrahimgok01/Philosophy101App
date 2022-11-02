//
//  datafactory2.swift
//  Philosophy101OfflineEdition
//
//  Created by Ibrahim Gok on 2.11.2022.
//

import Foundation
import UIKit


struct phi2_data: Identifiable {

    var id : String = ""
    var phiName : String = ""
    var phiDate : String = ""
    var phiAkim : String = ""
    var phiType : String = ""
    var phiDes : String = ""
    
    
    init(raw: [String]) {
        
        id = raw[0]
        phiName = raw[1]
        phiDate = raw[2]
        phiAkim = raw[3]
        phiType = raw[4]
        phiDes = raw[5]
        
        
    }
}



func loadCSV2(from csvName: String) -> [phi2_data] {
    var csvToStruct = [phi2_data]()
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
        let Data_Struct = phi2_data.init(raw: csvColumns)
        csvToStruct.append(Data_Struct)
        }
    }
    return csvToStruct
}
