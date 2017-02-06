//
//  ViewController.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 25/01/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let Json = ParsingFileBarnabot.sharedIntances.loadFile();
        let Barnabot = ParsingFileBarnabot.sharedIntances.readJsonProfileBarnabot(object: Json)
        print(Barnabot.description)
        print(ParsingFileBarnabot.sharedIntances.readJsonSearch(object: Json))
        
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

