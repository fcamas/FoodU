//
//  TabBarView.swift
//  FoodU
//
//  Created by Fredy Camas on 09/01/23.
//

import UIKit

class TabBarView: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTabViews()
    }
    private func loadTabViews() {
        let homeController = HomeController()
        let favController = FavController()

        homeController.tabBarItem.image = UIImage(systemName: "person")
        let navController = UINavigationController(rootViewController: homeController)
        
        
        favController.title = "Favorite"
        favController.tabBarItem.image = UIImage(systemName: "star")
        favController.tabBarItem.badgeValue = "1"
        let navControllerfav = UINavigationController(rootViewController: favController)
        
        
        
        self.setViewControllers([navController, navControllerfav], animated: false)
        self.tabBar.backgroundColor = .blue
    }
}
