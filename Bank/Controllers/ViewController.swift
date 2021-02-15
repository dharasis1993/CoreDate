//
//  ViewController.swift
//  Bank
//
//  Created by dharasis behera on 30/01/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var autoLayout: NSLayoutConstraint!
    @IBOutlet weak var txtFldUserName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
//        createTestJson()
    }

    @IBAction func onClickLogin(_ sender: Any) {
        if txtFldUserName.text == Default.deleteText.rawValue {
            CoreDataManager.sharedInstance.clearDatabase()
        }
    }

    func createTestJson() {
        var parentArray = [[String: Any]]()
        for i in 1...2000 {
            let array: [String: Any] = [
                              "balance": 1000,
                              "name": "Dharasis",
                              "branchCode": 8214,
                              "customerId": 123 + i,
                              "dob": getDateFromString(date: "31/07/1993"),
                              "status": "open",
                "photo": UIImage(named: "avtar")!.pngData()!

                    ]
            parentArray.append(array)
        }
        batchInsertFireballs(parentArray)

    }
    private func batchInsertFireballs(_ fireballs: [[String: Any]]) {
      // 1
      guard !fireballs.isEmpty else { return }

        let bgContext = CoreDataStack.persistentContainer.newBackgroundContext()
            bgContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        let mainContext = CoreDataStack.persistentContainer.viewContext

        bgContext.perform {

            // 3
            let batchInsert = self.newBatchInsertRequest(with: fireballs)
            do {
                let result =  try bgContext.execute(batchInsert) as? NSBatchInsertResult
                          if let objectIDs = result?.result as? [NSManagedObjectID], !objectIDs.isEmpty {
                                 let save = [NSInsertedObjectsKey: objectIDs]
                                NSManagedObjectContext.mergeChanges(fromRemoteContextSave: save, into: [mainContext])
                          }
            } catch {
              // log any errors
                print(error.localizedDescription)
            }

//        let insertRequest = NSBatchInsertRequest(entity: Movie.entity(), objects: movieDicts)
//                insertRequest.resultType = NSBatchInsertRequestResultType.objectIDs
//                let result = try? bgContext.execute(insertRequest) as? NSBatchInsertResult

         }

    }
    private func newBatchInsertRequest(with fireballs: [[String: Any]])
      -> NSBatchInsertRequest {
      // 1
      var index = 0
      let total = fireballs.count

      // 2
      let batchInsert = NSBatchInsertRequest(
        entity: CustomerManagedDataModel.entity()) { (managedObject: NSManagedObject) -> Bool in
        // 3
        guard index < total else { return true }

        if let fireball = managedObject as? CustomerManagedDataModel {
          // 4
           let data = fireballs[index]
            fireball.customerId = Int32(data["customerId"] as! Int)
          fireball.name = data["name"] as? String
            fireball.dob = data["dob"] as? Date
            fireball.balance = Int32(data["balance"] as! Int)
          fireball.status = data["status"] as? String
            fireball.branchCode = Int16(data["branchCode"] as! Int)
//            fireball.photo = data["photo"] as? Data
        }

        // 5
        index += 1
        return false

      }
      return batchInsert
    }
    private func getDateFromString(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: date) ?? Date()
    }

}
