//
//  OverlayView.swift
//  nandemo
//
//  Created by 坂本龍哉 on 2024/04/17.
//

import UIKit

protocol OverlayViewDelegate: NSObjectProtocol {
    func onTap()
    func segue()
}

final class OverlayView: UIView {
    
    private weak var delegate: OverlayViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    func loadNib() {
        let nib = UINib(nibName: "OverlayView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        }
    }
    
    func setUp(delegagte: OverlayViewDelegate) {
        self.delegate = delegagte
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(onTap))
        self.addGestureRecognizer(tapGesture)
        
        delegagte.segue()
    }
    
    @objc private func onTap() {
        print(#function)
        delegate?.onTap()
    }
}
