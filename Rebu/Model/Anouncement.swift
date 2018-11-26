//
//  Anouncement.swift
//  Rebu
//
//  Created by SANTOSH SEKHAR M B on 11/26/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import Foundation

class Anouncement {
    
    var name:String
    var startPoint:String
    var endPoint:String
    var contact:String
    var extraInfo:String
    
    
    init() {
        self.name = "sde"
        self.startPoint = "sdc"
        self.endPoint = "sdc"
        self.contact = "2323232"
        self.extraInfo = "xaxa acac acacas"
    }
    
}

class Anouncements {
    
    static var anounce:Anouncements = Anouncements()
    
    var anouncementTakeRide:[Anouncement] = [Anouncement() ]
    var anouncementGiveeRide:[Anouncement] = [Anouncement() ]
    
    
    func addTakeAnouncement(x:Anouncement)
    {
        
        anouncementTakeRide.append(x)
        
    }
    
    func addGiveAnouncement(x:Anouncement)
    {
        
        anouncementTakeRide.append(x)
        
    }
    
    
    
    
    
    
    
    
    
    


}
