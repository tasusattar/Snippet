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
    
    var buttonTag : Int = 0
    

    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        buttonTag = sender.tag
        buttonTag -= 1
        self.performSegue(withIdentifier: "SettingsScreen", sender: self)
    }

    @IBAction func sortPressed(_ sender: Any) {
        openSort()
    }
    
    @IBAction func addPressed(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let collectionNav = storyBoard.instantiateViewController(withIdentifier: "collectionNav") as! UINavigationController
        let collectionView = collectionNav.viewControllers.first as! CollectionViewController
        
        self.present(collectionNav, animated: false, completion: collectionView.addBooksBlur)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SettingsScreen"{
            let navView = segue.destination as! UINavigationController
            let settingsView = navView.viewControllers.first as! SettingsViewController
            settingsView.tabIndex = buttonTag
        }
    }
    
    
    
    /*
     animates in SortOptionsView
     */
    func openSort(){
        self.view.addSubview(SortList)
        SortList.center = self.view.center
        SortList.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.2){
            
            self.SortList.alpha = 1
            self.SortList.transform = CGAffineTransform.identity
        }
    }
    
    func closeSort(){
        UIView.animate(withDuration: 0.2, animations: {
            self.SortList.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            self.SortList.alpha = 0
        }){(success: Bool) in
            self.SortList.removeFromSuperview()
        }
    }
    


}
