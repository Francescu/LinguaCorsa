//
//  StrongLabel.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 12/07/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit

class StrongLabel: UILabel {

    init(frame: CGRect) {
        super.init(frame: frame)
        self._setup()
    }
    
    func _setup () {
        //Due to Swift lack of appearanceWhenContainedIn
        self.font = StrongLabel.appearance().font
    }
}
