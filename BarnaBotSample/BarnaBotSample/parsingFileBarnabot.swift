//
//  parsingFileBarnabot.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 05/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import Foundation

public class ParsingFileBarnabot{
    
    public static let sharedIntances = ParsingFileBarnabot()
    
    func loadFile()-> [String: AnyObject]{
        var dictionary:[String: AnyObject]? = nil
        let bundle = Bundle(for: type(of: self))
        if let theURL = bundle.url(forResource: "Barnabot", withExtension: "json") {
            do {
                let data = try Data(contentsOf: theURL)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                dictionary = object as? [String : AnyObject]
                return dictionary!
                
            } catch {
                print(error)
                
            }
        }
        return dictionary!
    }
    
    func readJSONObject(object: [String: AnyObject]) {
        
    }
    
    func readJsonProfileBarnabot(object: [String: AnyObject]) -> BBotInfo{
        
        let profileBarnabot = object[BarnaBot.Json.ProfileBarnabot.jsonObject] as? [String: AnyObject]
        let name = profileBarnabot?[BarnaBot.Json.ProfileBarnabot.name] as? String
        let old = profileBarnabot?[BarnaBot.Json.ProfileBarnabot.old] as? Int
        let gender = profileBarnabot?[BarnaBot.Json.ProfileBarnabot.gender] as? String
        let defaulCharacter = profileBarnabot?[BarnaBot.Json.ProfileBarnabot.defaultCharacter] as? String
        let img = profileBarnabot?[BarnaBot.Json.ProfileBarnabot.img] as? String
        let description = profileBarnabot?[BarnaBot.Json.ProfileBarnabot.description] as? String
        return BBotInfo(name: name!,img: img!,old: old!,gender: gender!,botType: defaulCharacter!,descriptionBot: description!)
       
    }
    
    func readJsonSearch(object: [String: AnyObject]){
        let searchBarnabot = object[BarnaBot.Json.Search.search] as? [String: AnyObject]
        for(key, value) in searchBarnabot!{
            print(key,value)
        }
        
    }
    
}
