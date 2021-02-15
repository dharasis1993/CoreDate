//
//  CoreDataManager.swift
//  Bank
//
//  Created by dharasis behera on 01/02/21.
//

import Foundation
import CoreData

class CoreDataManager {

    static let sharedInstance = CoreDataManager()
    private init() {}

   func getManagedContext() -> NSManagedObjectContext { CoreDataStack.persistentContainer.viewContext
     }

    func getManagedObject(for entityName: String) -> NSManagedObject {

         let entity =
           NSEntityDescription.entity(forEntityName: entityName,
                                      in: getManagedContext())!
         let managedObject = NSManagedObject(entity: entity,
                                      insertInto: getManagedContext())
        return managedObject
     }
    // MARK: - Core Data Saving support
    func saveContext (completion:() -> Void) {
        let context = getManagedContext()
        if context.hasChanges {
            do {
                try context.save()
                completion()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchConetext(entityName: String, fetchedresultList  completion: ([NSManagedObject]) -> Void) {
        let managedContext = getManagedContext()
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: entityName)
        do {
            let fetchedResult: [NSManagedObject] = try managedContext.fetch(fetchRequest)
            completion(fetchedResult)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    func clearDatabase() {
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CustomerEntityAtrributes.enityName.rawValue)

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try getManagedContext().execute(batchDeleteRequest)

        } catch {
            // Error Handling
        }
    }

}
