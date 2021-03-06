//
//  AppDelegate.swift
//  UberEATS
//
//  Created by WorldMobile on 11/25/17.
//  Copyright © 2017 WorldMobile. All rights reserved.
//

import UIKit
import CoreData
import GoogleMaps
import GooglePlaces
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?
    var businesses: [NSManagedObject] = []
    
    // Please obtain your own google map key
    let GOOGLE_KEY = KEYS.GOOGLE_MAP_KEY
    
    lazy var tabBarController: TabBarController = {
        let tabBarController = TabBarController()
        return tabBarController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Add Google Maps
        GMSServices.provideAPIKey(GOOGLE_KEY)
        GMSPlacesClient.provideAPIKey(GOOGLE_KEY)
        
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        // Crashlystics
        Fabric.with([Crashlytics.self])
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UberEATS")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
