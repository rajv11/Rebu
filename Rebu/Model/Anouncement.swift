//
//  Anouncement.swift
//  Rebu
//
//  Created by SANTOSH SEKHAR M B on 11/26/18.
//  Copyright © 2018 Jennaikode,Vamshi Raj. All rights reserved.
//

import Foundation

@objcMembers

class Anouncement: NSObject {
    
    var name:String
    var startPoint:String
    var endPoint:String
    var contact:String
    var extraInfo:String
    
    override var description: String
    {
        return " name:\(name), startpoint:\(startPoint), endpoint:\(endPoint), contact:\(contact), extraInfo\(extraInfo)"
    }
    
    init(name:String, startPoint:String, endPoint:String, contact:String, extra:String) {
        self.name = name
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.contact = contact
        self.extraInfo = extra
    }
    
    convenience override init()
    {
        self.init(name:"SS", startPoint:"Maryville", endPoint:"Kansas City", contact:"123456789", extra:"Lets meet at a common point")
    }
    
    
    
}


@objcMembers
class Anouncements {
    
    
    let backendless = Backendless.sharedInstance()
    var itemDataStore:IDataStore!
    
    static var anounce:Anouncements = Anouncements()
    
    var anouncementTakeRide:[Anouncement] = []
    var anouncementGiveRide:[Anouncement] = []
    
    init()
    {
        itemDataStore = backendless?.data.of(Anouncement.self)
    }
    
    var rideSelect:String = ""
//    func addTakeAnouncement(x:Anouncement)
//    {
//
//        anouncementTakeRide.append(x)
//
//    }
    
//    func addGiveAnouncement(x:Anouncement)
//    {
//        
//        anouncementGiveRide.append(x)
//        
//    }
    
    func saveTakeRideAnouncements(name:String, startPoint:String, endPoint:String, contact:String, extra:String )
    {
        var itemToSave = Anouncement(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extra)
        
        itemDataStore.save(itemToSave,response:{(result) -> Void in
            itemToSave = result as! Anouncement
            self.anouncementTakeRide.append(itemToSave)
            self.retrieveAllTakeRides() },
                           
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
            
        })
    }
    
    func saveGiveRideAnouncements(name:String, startPoint:String, endPoint:String, contact:String, extra:String )
    {
        var itemToSave = Anouncement(name: name, startPoint: startPoint, endPoint: endPoint, contact: contact, extra: extra)
        
        itemDataStore.save(itemToSave,response:{(result) -> Void in
            itemToSave = result as! Anouncement
            self.anouncementGiveRide.append(itemToSave)
            self.retrieveAllGiveRides() },
                           
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
                            
        })
    }

    
    func retrieveAllTakeRides()
    {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setRelated(["anouncementTakeRide"] )
        
        queryBuilder!.setPageSize(100)
        
        itemDataStore.find(queryBuilder, response: {(results) -> Void in
            self.anouncementTakeRide = results as! [Anouncement]
        },
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
        })
    }
    
    func retrieveAllGiveRides()
    {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setRelated(["anouncementGiveeRide"] )
        
        queryBuilder!.setPageSize(100)
        
        itemDataStore.find(queryBuilder, response: {(results) -> Void in
            self.anouncementGiveRide = results as! [Anouncement]
        },
                           error:{(exception) -> Void in
                            print(exception.debugDescription)
        })
    }
    
    
    
    
    
    
    


}
