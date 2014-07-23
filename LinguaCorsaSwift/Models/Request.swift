//
//  Request.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 15/07/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import Foundation

class Request {
    let value:String
    let language:Language
    
    var results:Array<Word> = []
    
    init (value:String, language:Language) {
        self.value = value
        self.language = language
    }
}