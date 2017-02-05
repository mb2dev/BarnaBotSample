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
    public var gender:String // true men false woman
    
    init(name:String, old:Int, gender:String){
        self.name = name
        self.old = old
        self.gender = gender
    }
    
    public override var description: String{
        var result:String = "User info : \n"
        result.append("\t - name : " + self.name)
        result.append("\n\t - old : " + String(self.old))
        result.append("\n\t - gender : " + self.gender)
        return result
    }
    // maybe create sharedInstance for add function to check value
}
