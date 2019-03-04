//
//  SharedImagesGridViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridInteracting {
    func loadImages()
    func goToImageEditor()
    func goToImagePreview(for image: UIImage)
}

final class SharedImagesGridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: SharedImagesGridInteracting!
    var dataSource: SharedImagesGridDataSource!
    
    private struct ViewMeasures {
        static let interItemPadding: CGFloat = 5
        static let nrItemsPerRow: CGFloat = 3
    }
    
    private var layout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let itemSize = (collectionView.frame.width - (ViewMeasures.nrItemsPerRow + 1)
            * ViewMeasures.interItemPadding) / ViewMeasures.nrItemsPerRow
        
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = ViewMeasures.interItemPadding
        layout.minimumLineSpacing = ViewMeasures.interItemPadding
        layout.sectionInset = UIEdgeInsets(
            top: ViewMeasures.interItemPadding,
            left: ViewMeasures.interItemPadding,
            bottom: ViewMeasures.interItemPadding,
            right: ViewMeasures.interItemPadding
        )
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        addCreateImageButton()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.loadImages()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.collectionViewLayout = layout
    }
    
    private func applyStyle() {
        view.backgroundColor = UIColor.AppTheme.darkGrey
        applyNavigationBarStyle()
    }
        
    private func applyNavigationBarStyle() {
        guard let navigationBar = navigationController?.navigationBar
        else { return }
        
        navigationBar.barStyle = .blackTranslucent
        navigationBar.barTintColor = UIColor.AppTheme.darkGrey
        let backBarButtton = UIBarButtonItem(title: "Shared Images", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
    
    private func addCreateImageButton() {
        let createImageButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(createImageButtonTaped(_:))
        )
        createImageButton.tintColor = .white
        navigationItem.rightBarButtonItem = createImageButton
    }
    
    @objc private func createImageButtonTaped(_ sender: Any) {
        interactor.goToImageEditor()
    }
    
    private func setupCollectionView() {
        let nib = UINib.init(nibName: "SharedImagesGridCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "SharedImagesGridCell")
        collectionView.backgroundColor = UIColor.AppTheme.darkGrey
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
    }
        
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SharedImagesGridViewController: SharedImagesGridDisplaying {
    
    func display(_ sharedImages: [Meme]) {
        dataSource.set(sharedImages)
        collectionView.reloadData()
    }
}

extension SharedImagesGridViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let image = dataSource.image(for: indexPath)
        else { return }
        
        interactor.goToImagePreview(for: image)
    }
}
