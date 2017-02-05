//
//  BBotInfo.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 05/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import Foundation


public class BBotInfo : NSObject{
    
    var name:String
    var img:String
    var old:Int
    var gender:String
    var botType:String
    var descriptionBot:String
    
    init(name:String,img:String,old:Int, gender:String,botType:String,descriptionBot:String){
        self.name = name
        self.img = img
        self.old = old
        self.gender = gender
        self.botType = botType
        self.descriptionBot = descriptionBot
    }
    
    public override var description: String{
        var result:String = "Bot info : \n"
        result.append("\t - name : " + self.name)
        result.append("\n\t - img : " + self.img)
        result.append("\n\t - old : " + String(self.old))
        result.append("\n\t - gender : " + self.gender)
        result.append("\n\t botType : " + self.botType)
        result.append("\n\t descriptionBot : " + self.descriptionBot)
        return result
    }
    
}
