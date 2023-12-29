//
//  MainTapBarVC.swift
//  Refs
//
//  Created by Екатерина Никифорова on 28.12.2023.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarApperance()
        fetchDataFromServer()
    }
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(viewController: TasksVC(), title: "задания", image: UIImage(systemName: "square.grid.2x2")),
        generateVC(viewController: HowToPlayVC(), title: "правила", image: UIImage(systemName: "rotate.left")),
        generateVC(viewController: ProfileVC(), title: "профиль", image: UIImage(systemName: "person.circle"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
//        let nav = UINavigationController(rootViewController: viewController)
//        
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
//        
//        nav.viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
//        
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem?.tintColor = .mainBlue
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarApperance() {
        let positionX: CGFloat = 10;
        let positionY: CGFloat = 14;
        let width = tabBar.bounds.width - positionX * 2
        let height = tabBar.bounds.height + positionY * 2
        
        let backgroundLayer = CAShapeLayer()
        
        let bezier = UIBezierPath(
            roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY, width: width, height: height), cornerRadius: height / 2
        )
        
        backgroundLayer.path = bezier.cgPath
        
        tabBar.layer.insertSublayer(backgroundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
       
        
        backgroundLayer.fillColor = UIColor.white.cgColor
        
        tabBar.tintColor = .mainBlue
        tabBar.unselectedItemTintColor = .black
        
    }
    
//    private func createNav(with title: String, and image: UIImage?, and vc: UIViewController) -> UINavigationController {
//        
//        let nav = UINavigationController(rootViewController: vc)
//        
//        nav.tabBarItem.title = title
//        nav.tabBarItem.image = image
//        
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
//        
//        nav.viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: nil, action: nil)
//        
//        return nav
//    }
    
    func fetchDataFromServer() {
        
        print("data!!!!!!!!!!")
        // Replace the URL with the actual URL of your server endpoint

        if let url = URL(string: "http://localhost:3000/api/v1/tasks.json") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Check for errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                // Check for a succesful response
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print ("Error: invalid response")
                    return
                }

                // Parse the data
                if let data = data {
                    do {
                        self.getTasksFromData(data)
                //        let json = try JSONSerialization.jsonObject(with: data, options: [])
                //        print(json)
                    }
                }
            }
            // Start the task
            task.resume ()
        }
    }

    func getTasksFromData(_ data:Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        } catch {
            print ("Error parsing JSON: \(error)")
        }
    }

    
}
