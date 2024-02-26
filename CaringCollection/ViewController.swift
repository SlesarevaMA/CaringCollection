//
//  ViewController.swift
//  CaringCollection
//
//  Created by Margarita Slesareva on 26.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let collectionViewLayout = FlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureCollectionViewLayoutItemSize()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        navigationItem.title = "Collection"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.frame = view.bounds
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.isPagingEnabled = false
        collectionView.dataSource = self
        
        collectionViewLayout.scrollDirection = .horizontal
    }
    
    private func configureCollectionViewLayoutItemSize() {
        let leftInset = collectionView.layoutMargins.left
        let rightInset = collectionView.layoutMargins.right
        
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
        collectionViewLayout.itemSize = CGSize(
            width: collectionView.frame.size.width * 0.7,
            height: collectionView.frame.size.height * 0.5
        )
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 10
        
        return cell
    }
}
