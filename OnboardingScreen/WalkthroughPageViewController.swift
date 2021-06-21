//
//  ViewController.swift
//  OnboardingScreen
//
//  Created by Essa Aldo on 6/21/21.
//

import UIKit

protocol WalkThroughPageViewControllerDelegate: AnyObject {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController {
    
    // Mark: - Properties
    var currentIndex = 0
    var pageImages = ["moneyMoney1","moneyMoney2","moneyMoney3","moneyMoney4"]
    var pageHeadings = [
        "The simple and secure way to send, spend, and manage your money.",
        "Send Money fast to anyone in 100+ countries.",
        "Spend securely on millions of sites and apps.",
        "And Simply manage it all in one place.",
        ]
    
    var pageDescriptionText = [
        "Swipe to learn more.",
        "All you need is their email address and phone number to send or request money.",
        "Skip entering your bank or card info at checkout and know all your elligible purchases are protected by PayPal",
        "Send, spend, and receive using all your favorite cards and banks. Now keep track with just one account.",
        ]
    
    weak var walkThroughDelegate: WalkThroughPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the data source and delegate:
        dataSource = self
        delegate = self
        
        // create the first walkthrough screen:
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }

}


// Mark: DataSource:
extension WalkthroughPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data:
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.headingText = pageHeadings[index]
            pageContentViewController.descriptionText = pageDescriptionText[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
}


// Mark: UIPageViewControllerDelegate
extension WalkthroughPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
                currentIndex = contentViewController.index
                walkThroughDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
}
