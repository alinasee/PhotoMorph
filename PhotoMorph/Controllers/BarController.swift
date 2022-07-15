//
//  BarController.swift
//  PhotoMorph
//
//  Created by Alina on 14.06.22.
//

import UIKit

class BarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      settupControllers()
        
    }
    
    private func settupControllers() {
        
        let homeVC = HomeVC(nibName: String(describing: HomeVC.self), bundle: nil)
        let historyVC = HistoryVC(nibName: String(describing: HistoryVC.self), bundle: nil)
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "heart"), tag: 0)
        historyVC.tabBarItem = UITabBarItem(title: "History", image: nil, tag: 1)
        
        self.viewControllers = [homeVC, historyVC]
    }
    
}
