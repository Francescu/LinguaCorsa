//
//  RegularLabel.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 12/07/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit

class RegularLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self._setup()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _setup () {
        //Due to Swift lack of appearanceWhenContainedIn
        self.font = RegularLabel.appearance().font
    }

}
