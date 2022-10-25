//
//  ViewController.swift
//  SampleCodeScrollCollectionView
//
//  Created by 岩本康孝 on 2022/10/25.
//

import UIKit
import SuperEasyLayout

class ViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        return collectionView
    }()

    private var collectionViewHeightConstraint: NSLayoutConstraint!

    private lazy var errorView: UIView = {
        let view = UIView()
        view.height == 100
        view.backgroundColor = .red
        return view
    }()

    private lazy var tabViewFrameView: UIView = {
        let view = UIView()
        view.height == 100
        view.backgroundColor = .blue
        return view
    }()

    private lazy var tabView: UIView = {
        let view = UIView()
        view.height == 100
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        [scrollView, tabView].forEach {
            view.addSubview($0)
        }
        scrollView.top == view.top
        scrollView.left == view.left
        scrollView.right == view.right
        scrollView.bottom == view.bottom

        scrollView.addSubview(stackView)
        stackView.width == scrollView.width
        stackView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true

        [errorView, tabViewFrameView, collectionView].forEach {
            stackView.addArrangedSubview($0)

        }
        tabView.centerX == tabViewFrameView.centerX
        tabView.top >= self.view.top
        tabView.left == scrollView.left
        tabView.right == scrollView.right

        let centerYConstraint = tabView.centerYAnchor.constraint(equalTo: tabViewFrameView.centerYAnchor)
        centerYConstraint.priority = .defaultHigh
        centerYConstraint.isActive = true

        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(TextCollectionViewCell.self, forCellWithReuseIdentifier: "TextCollectionViewCell")
        collectionView.register(NoConstructionCell.self, forCellWithReuseIdentifier: "NoConstructionCell")
        collectionView.isScrollEnabled = false
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 50)
        collectionViewHeightConstraint.isActive = true
        scrollView.showsVerticalScrollIndicator = false
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        collectionViewHeightConstraint.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "NoConstructionCell", for: indexPath) as! NoConstructionCell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = self.view.safeAreaInsets.top + self.view.safeAreaInsets.bottom
        let height = self.view.frame.height - insets - 200
        return .init(width: collectionView.frame.width, height: 652)
    }
}
