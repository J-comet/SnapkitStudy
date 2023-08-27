//
//  ClickableLabel.swift
//  SnapkitStudy
//
//  Created by 장혜성 on 2023/08/27.
//

import UIKit
import SwiftUI

open class ClickableLabel: UILabel {
    var onClick: () -> Void = {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onClick()
    }
}

#if canImport(SwiftUI) && DEBUG
struct ClickableLabelPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let label = ClickableLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
            label.backgroundColor = .yellow
            label.text = "Wow234151223"
            return label
        }.previewLayout(.device)
        UIViewPreview {
            let label = ClickableLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
            label.text = "Wow212"
            return label
        }.previewLayout(.sizeThatFits)
    }
}
#endif
