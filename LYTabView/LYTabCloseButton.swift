//
//  LYTabCloseButton.swift
//  LYTabView
//
//  Created by Lu Yibin on 16/4/7.
//  Copyright © 2016年 Lu Yibin. All rights reserved.
//

import Foundation
import Cocoa

class LYTabCloseButton: LYHoverButton {
    private var closeImage = NSImage(named: NSImage.stopProgressTemplateName)?
        .scaleToSize(CGSize(width: 8, height: 8))
    var roundCornerRadius: CGFloat = 2

    func setupButton() {

        if #available(OSX 10.13, *) {
            closeImage = Bundle(for: LYTabView.self).image(forResource: "close")!
                .scaleToSize(CGSize(width: 8, height: 8))
        }

        self.setButtonType(.momentaryPushIn)
        self.bezelStyle = .shadowlessSquare
        self.image = closeImage
        self.isBordered = false
        self.imagePosition = .imageOnly
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    override func draw(_ dirtyRect: NSRect) {
        let path = NSBezierPath(roundedRect: self.bounds, xRadius: roundCornerRadius, yRadius: roundCornerRadius)
        if hovered {
            self.hoverBackgroundColor?.setFill()
        } else {
            self.backgroundColor.setFill()
        }
        path.fill()
        super.draw(dirtyRect)
    }
}
