//
//  CoreDataService.swift
//  CoreDataTest
//
//  Created by Nguyễn Đức Thọ on 09/04/2022.
//

import Foundation
import UIKit

class CoreDataService: NSObject, UIApplicationDelegate {
    var coreDataManager: CoreDataManager = CoreDataManager.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            let _ = try? await coreDataManager.fetchQuakes()
        }
        return true
    }
}
