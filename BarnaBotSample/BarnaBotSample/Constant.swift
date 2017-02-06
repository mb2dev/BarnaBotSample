//
//  Constant.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 05/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import Foundation

struct BarnaBot{
    
    struct config {
        
        struct Barnabot{
            static let defaultName = "Barnabot"
            static let defaultImg = "Test"
            static let defaultOld = 24
            static let defaultGender = "men"
            static let defaultBotType = "default"
            static let defaultDescrition = "description"
        }
    }
    
    struct Json{
        
        struct ProfileBarnabot {
            static let jsonObject = "profileBarnabot"
            static let name = "name"
            static let old = "old"
            static let img = "img"
            static let gender = "gender"
            static let description = "description"
            static let defaultCharacter = "defaultCharacter";
        }
        
        struct Search {
            static let search = "search"
        }
    
    }
    
    
}
