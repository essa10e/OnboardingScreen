//
//  WalkthroughContentViewController.swift
//  OnboardingScreen
//
//  Created by Essa Aldo on 6/21/21.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    // Mark: Outlets:
    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var descriptionTextLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    // Properties:
    var index = 0
    var headingText = ""
    var descriptionText = ""
    var imageFile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = headingText
        descriptionTextLabel.text = descriptionText
        imageView.image = UIImage(named: imageFile)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
