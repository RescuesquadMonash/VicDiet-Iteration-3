//
//  AppDelegate.swift
//  VicDiet
//
//  Created by Ming Yang on 29/3/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()

//        UserDefaults.standard.set(false, forKey:"everLaunched")
        
        
        
        

//        window = UIWindow()
//        window?.makeKeyAndVisible()
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let swipingPhysicalInputController = SwipingPhysicalInputController(collectionViewLayout: layout)
//        window?.rootViewController = swipingPhysicalInputController
        

//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        let homePageController = HomePageController(collectionViewLayout: UICollectionViewFlowLayout())
//        window?.rootViewController = UINavigationController(rootViewController: homePageController)
//
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.barTintColor = UIColor(red: 125/255, green: 206/255, blue: 148/255, alpha: 1)
        
        
        
        
//
//
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
//        let sample = UIViewController()
//        sample.view.backgroundColor = .white
//        window?.rootViewController = sample
//
//        let it: UIView = {
//            let mmb = UIView()
//            mmb.backgroundColor = .green
//            return mmb
//
//        }()
//
//        let this = UIView()
//        this.backgroundColor = .yellow
//        sample.view.addSubview(this)
//        this.tintColor = .yellow
        
//
//        sample.view.translatesAutoresizingMaskIntoConstraints = false
//
//
//
//        sample.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": it]))
//        sample.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(30)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": it]))
        
        
        
        preDownloadData()
        
        if((Auth.auth().currentUser) != nil){
            
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            
            
            
            let homePageController = HomePageController(collectionViewLayout: UICollectionViewFlowLayout())
            let navigationController = UINavigationController(rootViewController: homePageController)
//            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            navigationController.navigationBar.shadowImage = UIImage()
//            navigationController.navigationBar.isTranslucent = true
//            navigationController.view.backgroundColor = .clear
            //navigationController.navigationBar.barTintColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)
           
//            let gradient = CAGradientLayer()
//            //gradient.transform = CATransform3DMakeRotation(.pi / 4, 0, 0, 1)
//            gradient.frame = navigationController.navigationBar.bounds
//            gradient.startPoint = CGPoint(x: 0, y: 0)
//            gradient.endPoint = CGPoint(x: 1, y: 1)
//            gradient.colors = [UIColor(red: 55/255, green: 59/255, blue: 68/255, alpha: 1).cgColor, UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1).cgColor]
//            //gradient.locations = [0, 0.5, 1]
//            navigationController.navigationBar.layer.addSublayer(gradient)
            //navigationController.navigationBar.barTintColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            //navigationController?.presentTransparentNavigationBar()
            
            //UINavigationBar.appearance().tintColor=UIColor.yellow
            // Text
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .selected)
            
            window?.rootViewController = navigationController
            
        }
        
        
        return true
    }
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "VicDiet")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func preDownloadData(){
        print("We are downloading data。。。Please wait")
    }
    
    
    
    
    
}

