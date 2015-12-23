//
//  RecipeDetailViewController.swift
//  RecipeBook
//
//  Created by woofgl on 15/12/22.
//  Copyright © 2015年 woofgl. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet var recipeLabel: UILabel!
    
    var recipeName: NSString = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the Label text with the selected recipe
        recipeLabel.text = recipeName as String
        
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
