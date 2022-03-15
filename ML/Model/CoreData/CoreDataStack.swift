//
//  CoreDataStack.swift
//  Cosmetic
//
//  Created by Nguyễn Đức Thọ on 8/8/21.
//

import Foundation
import CoreData

class CoreDataStack {
    private let modelName: String
    
    lazy var managedContext: NSManagedObjectContext = { return self.storeContainer.viewContext
    }()
    
    init(modelName: String) {
        self.modelName = modelName }
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)") }
        }
        return container
    }()
    
    func importJSONDictArray<T: DecoableNSManagedObject>(type: T.Type,
                                                         forResource: String,
                                                         witExtension: String) -> Result<RecordImportedCount, Error> {
        return
            //Get url from file name and extension
            Bundle.main.urlResult(forResource: forResource, withExtension: witExtension)
            //data from url
            .flatMap {$0.dataResult()}
            //array json object fro data
            .flatMap {JSONSerialization.arrayJsonObjectResult(with: $0, options: [.fragmentsAllowed])}
            //import to CoreData -> number of successfully imported records
            .flatMap {$0.importToCoreData(managedContext: self.managedContext, type: type)}
    }
}
