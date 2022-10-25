//
//  TextCollectionViewCell.swift
//  SampleCodeScrollCollectionView
//
//  Created by 岩本康孝 on 2022/10/25.
//

import UIKit
import SuperEasyLayout

class TextCollectionViewCell: UICollectionViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(label)

        label.left == self.left + 10
        label.top == self.top
        label.right == self.right - 10
        label.bottom == self.bottom
    }
}
