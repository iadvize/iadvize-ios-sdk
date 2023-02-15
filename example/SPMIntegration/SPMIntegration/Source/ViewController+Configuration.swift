//
//  ViewController+Configuration.swift
//  SPMIntegration
//
//  Created by Alexandre Karst on 19/09/2018.
//  Copyright © 2018 iAdvize. All rights reserved.
//

import UIKit

extension ViewController {
    func setupUI() {
        setupView()
        setupNavigationBar()
        setupProductImageView()
    }

    func setupView() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.96, green: 0.49, blue: 0.38, alpha: 1.0)

        let smartImageView = UIImageView(image: UIImage(named: "Smart"))
        smartImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = smartImageView
    }

    func setupProductImageView() {
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 10.0
    }
}
