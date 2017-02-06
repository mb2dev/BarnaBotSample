//
//  Dialogue.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 05/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import Foundation

public class DialogStep: NSObject {
    
    public var name:String
    public var priority:Int
    public var responce:Response
    public var word:[String]
    
    init(name:String, priority:Int, responce:Response, word:[String]) {
        self.name = name
        self.priority = priority
        self.responce = responce
        self.word = word
    }
    
    public override var description: String{
        var result:String = "Step info : \n"
        result.append("\t - name : " + self.name)
        result.append("\n\t - priority : " + String(self.priority))
        result.append("\n\t - responce : " + responce.description )
        result.append("\n\t - word : " + self.word.description)
        return result
    }
    
    
}
