//
//  BarnabotButtonView.swift
//  BarnaBotSample
//
//  Created by Mickael Bordage on 01/02/2017.
//  Copyright © 2017 Mickael Bordage. All rights reserved.
//

import UIKit

class BarnabotButtonView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet var barnabotButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Bundle.main.loadNibNamed("BarnabotButtonView", owner: self, options: nil)
        configureButton()
        self.addSubview(self.view)
        
    }
    
    func configureButton()
    {
        barnabotButton.layer.cornerRadius = 0.5 * barnabotButton.bounds.size.width
        barnabotButton.clipsToBounds = true
    }
    
    

}
