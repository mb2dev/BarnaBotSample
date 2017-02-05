//
//  userInfo.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 05/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import Foundation


public class UserInfo : NSObject{
    
    public var name:String
    public var old:Int
    public var gender:Bool // true men false woman
    public var botType:String
    
    init(name:String, old:Int, gender:Bool,botType:String){
        self.name = name
        self.old = old
        self.gender = gender
        self.botType = botType
    }
    // maybe create sharedInstance for add function to check value
}
