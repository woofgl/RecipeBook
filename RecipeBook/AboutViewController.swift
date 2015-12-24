//
//  AboutViewController.swift
//  RecipeBook
//
//  Created by woofgl on 15/12/24.
//  Copyright © 2015年 woofgl. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Add code to load web content in UIWebView

//        //load with a url
//        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://github.com/")!))
        
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("about", ofType: "html")!)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
