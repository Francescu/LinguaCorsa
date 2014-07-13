//
//  AdececDataFetcher.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 04/06/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit

enum AdececSearchType:Int {
    case Matches = 0
    case BeginsWith = 1
    case EndsWith = 3
    case Contains = 2
    
    static func defaultValue() -> AdececSearchType {
        return self.Matches
    }
}
class AdececDataFetcher: NSObject {
    class func fetchRequest(word:String, language:Language,  callback:(Array<Word>?, NSError?) -> Void) {
        self.fetchRequest(word, language:language, type:AdececSearchType.defaultValue() , callback:callback)
    }
    
    class func fetchRequest(word:String, language:Language, type:AdececSearchType, callback:(Array<Word>?, NSError?) -> Void) {

        let url = self.buildURL(word, language:language, type:type)
        var request = NSURLRequest(URL: url, cachePolicy:NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 3)

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            response, data, error in
            
            if (!data)
            {
                callback(nil, error)
            } else {
                let root = RXMLElement(fromXMLData: data)
                let string = NSString(data: data, encoding: NSUTF8StringEncoding)
                var words = Array<Word>()
                
                root.iterate("resultat") {
                    element in
                    if let word = WordManager.entityFromXML(element, language: language) {
                        words.append(word)
                    }
                }

                if words.count == 0 {
                    if word.hasSuffix("s") {
                        self.fetchRequest(word.substringToIndex(countElements(word)-1), language: language, type: type, callback: callback)
                    } else if type == AdececSearchType.defaultValue() {
                        self.fetchRequest(word, language: language, type: AdececSearchType.BeginsWith, callback: callback)
                    } else {
                        callback(words, error)
                    }
                } else {
                    callback(words, error)
                }
            }
            
        }
    }
    
    class func buildURL (word:String, language:Language, type:AdececSearchType) -> NSURL {
        let root = "http://www.adecec.net/infcor/xmlreq.php?"
        
        var URLString = root.stringByAppendingFormat("l=%d", language.AdececCode())
        URLString += "&sc="+String(type.toRaw())+"&c="
        URLString += word.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        println(URLString)
        return NSURL.URLWithString(URLString)
    }
    
}
