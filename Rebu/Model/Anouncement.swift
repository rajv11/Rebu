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
    
    
    init(name:String, startPoint:String, endPoint:String, contact:String, extra:String) {
        self.name = name
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.contact = contact
        self.extraInfo = extra
    }
    
}

class Anouncements {
    
    static var anounce:Anouncements = Anouncements()
    
    var anouncementTakeRide:[Anouncement] = []
    var anouncementGiveRide:[Anouncement] = []
    
    var rideSelect:String = ""
    func addTakeAnouncement(x:Anouncement)
    {
        
        anouncementTakeRide.append(x)
        
    }
    
    func addGiveAnouncement(x:Anouncement)
    {
        
        anouncementGiveRide.append(x)
        
    }
    
    
    
    
    
    
    
    
    
    


}
