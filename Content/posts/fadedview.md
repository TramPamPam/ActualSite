
---
date: 2020-05-08 19:38
description: A simple example of faded UITextView
tags: first, article
---
# Faded text view

Implementation:

```
import UIKit
import Foundation
class FadedTextView: UITextView {
    private let containerInset: CGFloat = 40
    private let gradientOffsetTop: NSNumber = 0.1
    private let gradientOffsetBottom: NSNumber = 0.9

    override func layoutSubviews() {
        super.layoutSubviews()

        let maskLayer = CALayer()
        maskLayer.frame = bounds

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: bounds.origin.x, y: 0, width: bounds.width, height: bounds.height)
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.white.cgColor,
                                UIColor.white.cgColor,
                                UIColor.clear.cgColor]

        gradientLayer.locations = [0.0, gradientOffsetTop, gradientOffsetBottom, 1.0]

        maskLayer.addSublayer(gradientLayer)
        self.layer.mask = maskLayer

        textContainerInset = UIEdgeInsets(top: containerInset, left: 0, bottom: 0, right: 0)
    }
}
```

Screenshot:
<img src="/screenshot.png" width="375" height="667">
