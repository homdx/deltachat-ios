/*
 MIT License
 
 Copyright (c) 2017-2019 MessageKit
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

// swiftlint:disable explicit_acl

internal extension UIView {

    func makeBorder(color: UIColor = UIColor.red) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 2
    }

    func alignLeadingToAnchor(_ anchor: NSLayoutXAxisAnchor, paddingLeading: CGFloat = 0.0) {
        self.leadingAnchor.constraint(equalTo: anchor, constant: paddingLeading).isActive = true
    }

    func alignTrailingToAnchor(_ anchor: NSLayoutXAxisAnchor, paddingTrailing: CGFloat = 0.0) {
        self.trailingAnchor.constraint(equalTo: anchor, constant: -paddingTrailing).isActive = true
    }

    func alignTopToAnchor(_ anchor: NSLayoutYAxisAnchor, paddingTop: CGFloat = 0.0) {
        self.topAnchor.constraint(equalTo: anchor, constant: paddingTop).isActive = true
    }

    func alignBottomToAnchor(_ anchor: NSLayoutYAxisAnchor, paddingBottom: CGFloat = 0.0) {
        self.bottomAnchor.constraint(equalTo: anchor, constant: -paddingBottom).isActive = true
    }

    func fill(view: UIView, paddingLeading: CGFloat? = 0.0, paddingTrailing: CGFloat? = 0.0, paddingTop: CGFloat? = 0.0, paddingBottom: CGFloat? = 0.0) {
        alignLeadingToAnchor(view.leadingAnchor, paddingLeading: paddingLeading ??  0.0)
        alignTrailingToAnchor(view.trailingAnchor, paddingTrailing: paddingTrailing ?? 0.0)
        alignTopToAnchor(view.topAnchor, paddingTop: paddingTop ?? 0.0)
        alignBottomToAnchor(view.bottomAnchor, paddingBottom: paddingBottom ?? 0.0)
    }

    func constraintAlignTopTo(_ view: UIView) -> NSLayoutConstraint {
        return constraintAlignTopTo(view, paddingTop: 0.0)
    }

    func constraintAlignTopTo(_ view: UIView, paddingTop: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1.0,
            constant: paddingTop)
    }

    func constraintAlignBottomTo(_ view: UIView, paddingBottom: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -paddingBottom)
    }

    func constraintAlignLeadingTo(_ view: UIView, paddingLeading: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1.0,
            constant: paddingLeading)
    }

    func constraintAlignTrailingTo(_ view: UIView, paddingTrailing: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -paddingTrailing)
    }

    func constraintToBottomOf(_ view: UIView, paddingTop: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 1.0,
            constant: paddingTop)
    }

    func constraintToTrailingOf(_ view: UIView, paddingLeading: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1.0,
            constant: paddingLeading)
    }


    func constraintCenterXTo(_ view: UIView, paddingX: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: .centerX,
                                  relatedBy: .equal,
                                  toItem: view,
                                  attribute: .centerX,
                                  multiplier: 1.0,
                                  constant: paddingX)
    }

    func constraintCenterYTo(_ view: UIView, paddingY: CGFloat = 0.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: .centerY,
                                  relatedBy: .equal,
                                  toItem: view,
                                  attribute: .centerY,
                                  multiplier: 1.0,
                                  constant: paddingY)
    }

    func constraintHeightTo(_ height: CGFloat) -> NSLayoutConstraint {
        return heightAnchor.constraint(equalToConstant: height)
    }

    func constraintWidthTo(_ width: CGFloat) -> NSLayoutConstraint {
       return  widthAnchor.constraint(equalToConstant: width)
    }

    func fillSuperview() {
        guard let superview = self.superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false

	    let constraints: [NSLayoutConstraint] = [
    	    leftAnchor.constraint(equalTo: superview.leftAnchor),
    	    rightAnchor.constraint(equalTo: superview.rightAnchor),
    	    topAnchor.constraint(equalTo: superview.topAnchor),
    	    bottomAnchor.constraint(equalTo: superview.bottomAnchor)]
	    NSLayoutConstraint.activate(constraints)
    }

    func centerInSuperview() {
        guard let superview = self.superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func constraint(equalTo size: CGSize) {
        guard superview != nil else { return }
        translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ]
        NSLayoutConstraint.activate(constraints)

    }

    @discardableResult
    func addConstraints(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, centerYConstant: CGFloat = 0, centerXConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {

        if self.superview == nil {
            return []
        }
        translatesAutoresizingMaskIntoConstraints = false

        var constraints = [NSLayoutConstraint]()

        if let top = top {
            let constraint = topAnchor.constraint(equalTo: top, constant: topConstant)
            constraint.identifier = "top"
            constraints.append(constraint)
        }
        if let left = left {
            let constraint = leftAnchor.constraint(equalTo: left, constant: leftConstant)
            constraint.identifier = "left"
            constraints.append(constraint)
        }

        if let bottom = bottom {
            let constraint = bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant)
            constraint.identifier = "bottom"
            constraints.append(constraint)
        }

        if let right = right {
            let constraint = rightAnchor.constraint(equalTo: right, constant: -rightConstant)
            constraint.identifier = "right"
            constraints.append(constraint)
        }

        if let centerY = centerY {
            let constraint = centerYAnchor.constraint(equalTo: centerY, constant: centerYConstant)
            constraint.identifier = "centerY"
            constraints.append(constraint)
        }

        if let centerX = centerX {
            let constraint = centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant)
            constraint.identifier = "centerX"
            constraints.append(constraint)
        }

        if widthConstant > 0 {
            let constraint = widthAnchor.constraint(equalToConstant: widthConstant)
            constraint.identifier = "width"
            constraints.append(constraint)
        }

        if heightConstant > 0 {
            let constraint = heightAnchor.constraint(equalToConstant: heightConstant)
            constraint.identifier = "height"
            constraints.append(constraint)
        }

        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
