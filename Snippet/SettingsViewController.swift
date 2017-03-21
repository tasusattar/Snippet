//
//  SettingsViewController.swift
//  Snippet
//
//  Created by Paul on 2017-03-01.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationBarDelegate, UITabBarDelegate {
    
    @IBOutlet var SettingsTabBar: UITabBar!
    @IBOutlet var titleBar: UINavigationItem!
    @IBOutlet var settingsViewContainer: UIView!
    
    var tabIndex: Int = 0
    let indexToName = ["Account", "Settings", "Views", "Note Book"]
    weak var containerView: UIViewController?
    
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "GoBack", sender: self)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SettingsTabBar.delegate = self

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        SettingsTabBar.selectedItem = SettingsTabBar.items![tabIndex] as UITabBarItem
        
        changeViewUpdates()
        
        super.viewWillAppear(false)
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
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabIndex = tabBar.items!.index(of: item)!
        
        for view in self.settingsViewContainer.subviews {
            view.removeFromSuperview()
        }
        
        containerView?.removeFromParentViewController()
        
        changeViewUpdates()
    }
    
    func changeViewUpdates(){
        titleBar.title = indexToName[tabIndex]
    
        containerView = self.storyboard?.instantiateViewController(withIdentifier: indexToName[tabIndex])
        self.addChildViewController(self.containerView!)
        self.settingsViewContainer.addSubview(self.containerView!.view)
    }

}
