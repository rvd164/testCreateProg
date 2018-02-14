//
//  NewViewController.swift
//  14-UItableView
//
//  Created by rvd on 2/15/18.
//  Copyright © 2018 rvd. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    var textData: String?
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           Label.text = textData
        // Do any additional setup after loading the view.
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
