//
//  CollectionViewController.swift
//  Snippet
//
//  Created by Paul on 2017-02-28.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BookCell"

class CollectionViewController: UICollectionViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var AddBooksView: UIView!
//    @IBOutlet weak var BlurVisual: UIVisualEffectView!
    
    var effect: UIVisualEffect!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        // disable blur visual effects
//        effect = BlurVisual.effect
//        BlurVisual.effect = nil
        
        AddBooksView.layer.cornerRadius = 5 // make the AddBooksView rounded at edges
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func OptionsPopover(_ sender: Any) {
        self.performSegue(withIdentifier: "OptionsSegue", sender: self)
        
    }
    
    @IBAction func closeAddWindow(_ sender: Any) {
        addCancelBlur()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "OptionsSegue"{
            let vc = segue.destination
            
            let controller = vc.popoverPresentationController
            
            // this makes it a popoverPresentation for all devices, not just iPad
            
            if controller != nil{
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 16
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // dummy background color
        cell.backgroundColor = UIColor.black
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
    
    /* 
     animates in AddBooksView and activates the BlurVisual
    */
    func addBooksBlur(){
        self.view.addSubview(AddBooksView)
        AddBooksView.center = self.view.center
        AddBooksView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 0.4){
//            self.BlurVisual.effect = self.effect
            
            self.AddBooksView.alpha = 1
            self.AddBooksView.transform = CGAffineTransform.identity
        }
    }
    
    func addCancelBlur(){
        UIView.animate(withDuration: 0.3, animations: {
            self.AddBooksView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.AddBooksView.alpha = 0
//            self.BlurVisual.effect = nil
        }){(success: Bool) in
            self.AddBooksView.removeFromSuperview()
        }
    }
    
}
