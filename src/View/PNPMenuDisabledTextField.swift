//
//  PNPMenuDisabledTextField.swift
//  UIComponents
//
//  Created by Hugh Bellamy on 05/09/2015.
//  Copyright (c) 2015 Hugh Bellamy. All rights reserved.
//
import UIKit

@IBDesignable
private class PNPMenuDisabledTextField: UITextField {
    @IBInspectable private var menuEnabled: Bool = false
    @IBInspectable private var canPositionCaretAtStart: Bool = true
    @IBInspectable private var editingRectDeltaY: CGFloat = 0
    
    private func canPerformAction(_ action: Selector, withSender sender: AnyObject?) -> Bool {
        return menuEnabled
    }
    
    private override func caretRect(for position: UITextPosition) -> CGRect {
        if position == beginningOfDocument && !canPositionCaretAtStart {
            return super.caretRect(for: self.position(from: position, offset: 1)!)
        }
        return super.caretRect(for: position)
    }
    
    private override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: editingRectDeltaY)
    }
}
