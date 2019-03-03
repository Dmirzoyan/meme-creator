//
//  SharedImagesListViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListInteracting {
    func loadImages()
    func goToImageEditor()
}

final class SharedImagesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: SharedImagesListInteracting!
    var dataSource: SharedImagesListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        addCreateImageButton()
        setupTableView()
        
        interactor.loadImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
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
    
    private func setupTableView() {
        let nib = UINib.init(nibName: "SharedImagesListCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "SharedImagesListCell")
        tableView.backgroundColor = UIColor.AppTheme.darkGrey
        tableView.tableFooterView = UIView()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    @objc private func createImageButtonTaped(_ sender: Any) {
        interactor.goToImageEditor()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SharedImagesListViewController: SharedImagesListDisplaying {
    
    func display(_ sharedImages: [Meme]) {
        dataSource.sharedImages = sharedImages
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension SharedImagesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
