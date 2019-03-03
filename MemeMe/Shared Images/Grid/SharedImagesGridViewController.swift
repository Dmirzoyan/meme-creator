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
}

final class SharedImagesGridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: SharedImagesGridInteracting!
    var dataSource: SharedImagesGridDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        addCreateImageButton()
        setupCollectionView()
        
        interactor.loadImages()
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
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SharedImagesGridViewController: SharedImagesGridDisplaying {
    
    func display(_ sharedImages: [UIImage]) {
        dataSource.set(sharedImages)
    }
}
