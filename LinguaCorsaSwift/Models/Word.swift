//
//  WordDefinition.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 04/06/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit

enum Language: String
{
    case French = "Fr"
    case Corsican = "Co"

    func AdececCode() -> Int
    {
        switch self
        {
            case .French: return 1
            case .Corsican: return 0
        }
    }
}

class Word {
    var identifier: String?
    let word: String
    var language: Language?
    var definition: String?
    var translation: String?
    var synonymes: String?
    
    init(word: String)
    {
        self.word = word
    }
}
