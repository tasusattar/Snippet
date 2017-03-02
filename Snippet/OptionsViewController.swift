//
//  OptionsViewController.swift
//  Snippet
//
//  Created by Paul on 2017-02-28.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var SortList: UIView!
    @IBOutlet var OptionsView: UIView!
    

    @IBAction func optionsButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "SettingsScreen", sender: self)
    }

    @IBAction func sortPressed(_ sender: Any) {
        self.view = SortList
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let collectionNav = storyBoard.instantiateViewController(withIdentifier: "CollectionNav") as! UINavigationController
        let cv = collectionNav.viewControllers.first as! CollectionViewController
        
        self.present(collectionNav, animated: false, completion: cv.addBooksBlur)

    }
    
    
    func returnView(){
        self.view = OptionsView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    
//        if segue.identifier == "AddBooksSegue"{
//            let vc = segue.destination.parent as! CollectionViewController!
//            vc?.addBooksBlur()
//            
//        }
//    }
    

}
