//
//  OverlayView.swift
//  nandemo
//
//  Created by 坂本龍哉 on 2024/04/17.
//

import UIKit

final class OverlayView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func setUp() {
        let nib = UINib(nibName: "OverlayView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }
}
