import UIKit

class UIBorderedLabel: UILabel {
    
    let padding = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
    
    override func drawTextInRect(rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, padding)
        super.drawTextInRect(newRect)
    }
    
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()
        intrinsicContentSize.height += padding.top + padding.bottom
        intrinsicContentSize.width += padding.left + padding.right
        return intrinsicContentSize
    }
    
}