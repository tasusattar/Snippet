//
//  HtmlViewController.swift
//  Snippet
//
//  Created by Paul on 2017-04-03.
//  Copyright © 2017 Refinery. All rights reserved.
//

import UIKit

class HtmlViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    @IBOutlet var prevButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    @IBAction func PrevPage(_ sender: Any) {
        pageNum -= 1
        selectedPage = selectPage(page: pageNum)
        self.webView.loadRequest(NSURLRequest(url: Bundle.main.url(forResource: selectedPage, withExtension: "html", subdirectory: "books/HtmlTests")!) as URLRequest)
    }
    @IBAction func NextPage(_ sender: Any) {
        pageNum += 1
        selectedPage = selectPage(page: pageNum)
        self.webView.loadRequest(NSURLRequest(url: Bundle.main.url(forResource: selectedPage, withExtension: "html", subdirectory: "books/HtmlTests")!) as URLRequest)
    }
    
    var pageNum = 0
    var book = BookShelf.getBookHtmlAt(bookIndex: 0)
    var selectedPage : String? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedPage = selectPage(page: pageNum)
        
        self.webView.loadRequest(NSURLRequest(url: Bundle.main.url(forResource: selectedPage, withExtension: "html", subdirectory: "books/HtmlTests")!) as URLRequest)

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
    
    func selectPage(page : Int) -> String{
        if (page == 0){
            prevButton.isHidden = true
            prevButton.isEnabled = false
        }
        else if (page == self.book.count-1){
            nextButton.isHidden = true
            nextButton.isEnabled = false
        }
        else{
            prevButton.isHidden = false
            prevButton.isEnabled = true
            
            nextButton.isHidden = false
            nextButton.isEnabled = true
        }
        
        return book[page]
        
    }
    
}
