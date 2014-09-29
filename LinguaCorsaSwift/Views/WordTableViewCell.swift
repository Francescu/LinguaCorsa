//
//  WordTableViewCell.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 12/07/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import UIKit
import QuartzCore

class WordTableViewCell: UITableViewCell {
    var word:Word!
    let wordLabel = StrongLabel(frame: CGRectZero)
    let translationLabel = RegularLabel(frame: CGRectZero)
    let definitionLabel = RegularLabel(frame: CGRectZero)
    let synonymesLabel = RegularLabel(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier?)
        // Initialization code
        self.backgroundColor = UIColor.clearColor()
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView.backgroundColor = UIColor(white: 0.97, alpha: 1)
        self.contentView.addSubview(self.wordLabel)
        self.contentView.addSubview(self.translationLabel)
        self.contentView.addSubview(self.definitionLabel)
        self.contentView.addSubview(self.synonymesLabel)
        self.contentView.clipsToBounds = true
        self.clipsToBounds = true
        self.textLabel?.hidden = true
        self.detailTextLabel?.hidden = true
        self.definitionLabel.layer.opacity = 0
        self.synonymesLabel.layer.opacity = 0
        self.definitionLabel.numberOfLines = 2
        self.synonymesLabel.numberOfLines = 2
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let padding:CGFloat = 10.0
        let width = self.contentView.bounds.size.width - 2 * padding
        let height = self.contentView.bounds.size.height
        self.wordLabel.frame = CGRectMake(padding, padding, width, 25)
//        var translationHeight:CGFloat = CGRectGetMaxY(self.contentView.frame) - CGRectGetMaxY(self.wordLabel.frame) - padding
//        if self.selected {
//            translationHeight -= 80
//        }
        let translationHeight:CGFloat = 55
        self.translationLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.wordLabel.frame), width, translationHeight)
        self.definitionLabel.frame = CGRectMake(10, CGRectGetMaxY(self.translationLabel.frame), width, 40)
        self.synonymesLabel.frame = CGRectMake(10, CGRectGetMaxY(self.definitionLabel.frame), width, 40)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.translationLabel.numberOfLines = selected ? 0 : 0
        // Configure the view for the selected state
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = NSNumber(float: self.definitionLabel.layer.opacity)
        animation.toValue = selected ? 1 : 0
        animation.duration = 0.15
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        self.definitionLabel.layer.addAnimation(animation, forKey: "selection")
        let animation2 = CABasicAnimation(keyPath: "opacity")
        animation2.fromValue = NSNumber(float: self.synonymesLabel.layer.opacity)
        animation2.toValue = selected ? 1 : 0
        animation2.duration = 0.15
        animation2.fillMode = kCAFillModeForwards
        animation2.removedOnCompletion = false
        self.synonymesLabel.layer.addAnimation(animation2, forKey: "selection")
    }
    
    func configure(entity:Word) {
        
        self.wordLabel.text = entity.word
        self.translationLabel.text = entity.translation
        self.definitionLabel.text = entity.definition
        self.synonymesLabel.text = entity.synonymes
    }

}
