// Playground - noun: a place where people can play

import UIKit
import CloudKit


var str = "Hello, playground"

let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
let privateDatabase = CKContainer.defaultContainer().privateCloudDatabase


let recordID = CKRecordID(recordName: "1")
let record = CKRecord(recordType: "Party", recordID:recordID)
record.setObject("House Party", forKey: "title")
record.setObject("SF", forKey: "city")

let reference = CKReference(recordID: recordID, action: CKReferenceAction.None)


publicDatabase.saveRecord(record) {
    rec, err in
    if (err) {
        err
    } else {
      rec
    }
}
