//
//  ViewController.swift
//  gamesProgrammatically
//
//  Created by Артём on 13.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBar()
        
        
    }

    func setupTabBar()
    {
        let gameVeiwController = createNavController(vc: GameViewController(), itemName: "Играть", ItemImage: "gamecontroller")
        
        let calcVeiwController = createNavController(vc: CalcViewController(), itemName: "Калькулятор", ItemImage: "plus.forwardslash.minus")
        
        
        viewControllers = [gameVeiwController, calcVeiwController]
        
        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .black
        self.tabBar.isTranslucent = true
        
    }

    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController
    {
        
        
        let navController = UINavigationController(rootViewController: vc)
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage), tag: 0)
        navController.tabBarItem = item
        
        return navController
        
        
    }
    
}


