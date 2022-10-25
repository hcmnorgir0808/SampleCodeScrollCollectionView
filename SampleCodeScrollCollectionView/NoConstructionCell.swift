//
//  NoConstructionCell.swift
//  SampleCodeScrollCollectionView
//
//  Created by 岩本康孝 on 2022/10/25.
//

import UIKit
import SuperEasyLayout

class NoConstructionCell: UICollectionViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    func setup() {
        addSubview(label)

        label.centerX == centerX
        label.centerY == centerY
    }
}
