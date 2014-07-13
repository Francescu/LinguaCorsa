//
//  WordManager.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 17/06/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import Foundation

//
//  PartyManager.swift
//  Party
//
//  Created by Francescu SANTONI on 06/06/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

//import Foundation
//import CloudKit

enum ManagerError:Int {
    case MissingRecordID = 12001
    case Unknown = 12800
    
    func getNSError() -> NSError {
        return NSError(domain: "com.cloudkit.manager.party", code: self.toRaw(), userInfo: nil)
    }
}

let RecordTypeWord = "Word"

class WordManager {
//    class func entityFromRecord(record: CKRecord) -> Word? {
//        if record.recordType == RecordTypeWord {
//            if let word = record.objectForKey("word") as? String {
//                let entity = Word(word: word)
//                if let language = record.objectForKey("language") as? String {
//                    entity.language = language == "Fr" ? Language.French : Language.Corsican
//                    
//                    entity.definition = record.objectForKey("definition") as? String
//                    entity.translation = record.objectForKey("translation") as? String
//                    entity.synonymes = record.objectForKey("synonymes") as? String
//                    
//                    return entity
//                }
//            }
//        }
//        return nil
//    }
    
    class func entityFromXML(element: RXMLElement, language:Language?) -> Word? {
            if let word = element.child("mot").text {
                let entity = Word(word: word)
                    entity.language = language
                    
                    entity.definition = element.child("definition").text
                    entity.translation = element.child("traduction").text
                    entity.synonymes = element.child("synonymes").text
                    
                    return entity
            }
        return nil
    }
    
//    class func recordFromEntity(entity:Word) -> CKRecord? {
//        var record:CKRecord
//        
//        if let recordName = entity.identifier {
//            record = CKRecord(recordType: RecordTypeWord, recordID: CKRecordID(recordName: recordName))
//        } else {
//            record = CKRecord(recordType: RecordTypeWord)
//        }
//        
//        record.setObject(entity.word, forKey: "word")
//        if entity.language {
//            record.setObject(entity.language!.toRaw(), forKey: "language")
//        }
//        record.setObject(entity.definition, forKey: "definition")
//        record.setObject(entity.translation, forKey: "translation")
//        record.setObject(entity.synonymes, forKey: "synonymes")
//        
//        return record
//    }
//    
//    class func save(entity:Word, completion:(NSError? -> Void)) -> Void {
//        let db = CKContainer.defaultContainer().publicCloudDatabase
//        db.saveRecord(self.recordFromEntity(entity)) {
//            record, error in
//            
//            dispatch_async(dispatch_get_main_queue()) {
//                if (!error) {
//                    entity.identifier = record.recordID.recordName
//                }
//                
//                completion(error)
//            }
//        }
//    }
//    
//    class func delete(entity:Word, completion:(NSError? -> Void)) -> Void {
//        let db = CKContainer.defaultContainer().publicCloudDatabase
//        
//        if let recordID = self.recordFromEntity(entity)?.recordID {
//            db.deleteRecordWithID(recordID) {
//                recordID, error in
//                
//                dispatch_async(dispatch_get_main_queue()) {
//                    completion(error)
//                }
//            }
//        } else {
//            completion(ManagerError.MissingRecordID.getNSError())
//        }
//    }
//    
//    class func findWhere(wherePredicate:NSPredicate, completion:(Array<Word>?,NSError?) -> Void) {
//        let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
//        let query = CKQuery(recordType: RecordTypeWord, predicate: wherePredicate)
//        let queryOperation = CKQueryOperation(query: query)
//        publicDatabase.performQuery(query, inZoneWithID: nil) {
//            results, error in
//            
//            dispatch_async(dispatch_get_main_queue()) {
//                if (error) {
//                    println(error)
//                    completion(nil,error)
//                } else {
//                    println(results)
//                    var entities = Array<Word>()
//                    
//                    for record in results as Array<CKRecord> {
//                        if let entity = self.entityFromRecord(record) {
//                            entities.append(entity)
//                        }
//                    }
//                    completion(entities, nil)
//                }
//            }
//        }
//    }
//    
//    class func findAll(completion:(Array<Word>?,NSError?) -> Void) {
//        self.findWhere(NSPredicate(value: true), completion: completion)
//    }
    
}