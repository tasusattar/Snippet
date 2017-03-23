//
//  FocusViewController.swift
//  Snippet
//
//  Created by Paul on 2017-03-23.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

class FocusViewController: UIViewController {
    
    var book = BookShelf.getBookAt(bookIndex: 0)
    
    var pageSelected : Snip? = nil
    
    var i = 0
    
    
    @IBAction func NextPage(_ sender: UIButton) {
        i += 1
        pageSelected = selectPage(page: i)
        TextField.text = pageSelected?.getContents()
    }
    
    @IBAction func PrevButton(_ sender: UIButton) {
        i -= 1
        pageSelected = selectPage(page: i)
        TextField.text = pageSelected?.getContents()
    }

    @IBOutlet var TextField: UILabel!
    @IBOutlet var PrevAttribute: UIButton!
    @IBOutlet var NextAttribute: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageSelected = selectPage(page: self.i)
        
        TextField.text = pageSelected?.getContents()
        
//        TextField.numberOfLines = 0
        
        // Do any additional setup after loading the view.
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
    
    func selectPage(page : Int) -> Snip{
        if (page == 0){
            PrevAttribute.isHidden = true
            PrevAttribute.isEnabled = false
        }
        else if (page == self.book.count-1){
            NextAttribute.isHidden = true
            NextAttribute.isEnabled = false
        }
        else{
            PrevAttribute.isHidden = false
            PrevAttribute.isEnabled = true
            
            NextAttribute.isHidden = false
            NextAttribute.isEnabled = true
        }
        
        return book[page]
    }


}
