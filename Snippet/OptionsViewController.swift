//
//  OptionsViewController.swift
//  Snippet
//
//  Created by Paul on 2017-02-28.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

//    @IBOutlet weak var personalButton: UIImageView!
//    @IBOutlet weak var settingsButton: UIImageView!
//    @IBOutlet weak var themesButton: UIImageView!
//    @IBOutlet weak var notesButton: UIImageView!
//    @IBOutlet weak var addButton: UIImageView!
//    @IBOutlet weak var sortButton: UIImageView!
    

    @IBAction func optionsButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SettingsScreen", sender: self)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        // create tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OptionsViewController.imageTapped(gesture:)))
//        
//        // add it to the image view;
//        personalButton.addGestureRecognizer(tapGesture)
//        settingsButton.addGestureRecognizer(tapGesture)
//        themesButton.addGestureRecognizer(tapGesture)
//        notesButton.addGestureRecognizer(tapGesture)
//        addButton.addGestureRecognizer(tapGesture)
//        sortButton.addGestureRecognizer(tapGesture)
//        
//        
//        // make sure imageView can be interacted with by user
//        personalButton.isUserInteractionEnabled = true
//        settingsButton.isUserInteractionEnabled = true
//        themesButton.isUserInteractionEnabled = true
//        notesButton.isUserInteractionEnabled = true
//        addButton.isUserInteractionEnabled = true
//        sortButton.isUserInteractionEnabled = true
//    }
//    
//    func imageTapped(gesture: UIGestureRecognizer) {
//        // if the tapped view is a UIImageView then set it to imageview
//        if (gesture.view as? UIImageView) != nil {
//            //Here you can initiate your new ViewController
//            if gesture.view == sortButton {
//                performSegue(withIdentifier: "SettingsScreen", sender: self)
//            }
//            
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
