//
//  RegularLabel.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 12/07/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit

class RegularLabel: UILabel {

    init(frame: CGRect) {
        super.init(frame: frame)
        self._setup()
    }
    
    func _setup () {
        self.font = RegularLabel.appearance().font
    }

}
