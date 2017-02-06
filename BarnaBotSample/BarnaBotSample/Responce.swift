//
//  Responce.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 05/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import Foundation


public class Response : NSObject{
    
    public let type:String
    public let value:String
    
    init(type:String, value:String) {
        self.type = type
        self.value = value
    }
    
    public override var description: String{
        var result = ""
        
    }
    
}
