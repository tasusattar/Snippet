//
//  SortOptionsView.swift
//  Snippet
//
//  Created by Paul on 2017-03-01.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

class SortOptionsView: UIView {
    
    @IBOutlet weak var OptionsView: OptionsViewController!
    
    @IBAction func backPressed(_ sender: Any) {
        OptionsView.closeSort()
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
