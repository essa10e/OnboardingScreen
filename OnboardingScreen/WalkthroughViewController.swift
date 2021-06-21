//
//  WalkthroughViewController.swift
//  OnboardingScreen
//
//  Created by Essa Aldo on 6/21/21.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkThroughPageViewControllerDelegate {
    
    // Mark: Outlet
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    // Mark: Properties:
    // a reference to the walkThroughPageViewController to update the currentIndex.
    var walkThroughPageViewController: WalkthroughPageViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walkThroughPageViewController?.walkThroughDelegate = self
        pageControl.numberOfPages = 4
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        pageControl.currentPage = currentIndex
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
