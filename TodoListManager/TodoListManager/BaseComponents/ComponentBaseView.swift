//
//  ComponentBaseView.swift
//  TodoListManager
//
//  Created by Joan Fabregat Bellido on 14/04/2017.
//  Copyright © 2017 Joan Fabregat Bellido. All rights reserved.
//

import Foundation

import UIKit

class ComponentBaseView: UIView {
    
    // MARK: Stored Properties
    var viewLocal: UIView?
    
    // MARK: Cycle life
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initializeSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame : CGRect = CGRect.init(x: 0 , y: 0, width:self.frame.size.width, height: self.frame.size.height)
        viewLocal?.frame = frame
        self.addSubview(viewLocal!)
    }
    
    func initializeSubviews() {
        NSException(name: NSExceptionName.internalInconsistencyException,
                    reason: "You must override \(#function) in a subclass", userInfo: nil).raise()
    }
}
