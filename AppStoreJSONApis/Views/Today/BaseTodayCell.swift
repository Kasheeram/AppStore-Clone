//
//  BaseTodayCell.swift
//  AppStoreJSONApis
//
//  Created by kashee on 26/03/24.
//

import UIKit


class BaseTodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem!
    
    override var isHighlighted: Bool {
        didSet {
            var transform: CGAffineTransform = .identity
            if isHighlighted {
                transform = .init(scaleX: 0.9, y: 0.9)
            }
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.transform = transform
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16
        
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        
        self.backgroundView?.layer.shouldRasterize = true
        
        
//        layer.shadowOpacity = 0.1
//        layer.shadowRadius = 10
//        layer.shadowOffset = .init(width: 0, height: 10)
//        
//        // this we are using for inscrase scrolling performance because we are using shadow in cell so its slowdown the performance, but there is a proble when we using shouldRasterize then cell text is showing blurry, so now we will use background view
//        layer.shouldRasterize = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
