//
//  ViewConfiguration.swift
//  Marvel
//
//  Created by Thiago Lioy on 18/12/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import Foundation

protocol ViewConfiguration: class {
    
    func setupViewConfiguration()
    func configureViews()
    func setupConstraints()
    func buildViewHierarchy()
}

extension ViewConfiguration {
    
    func setupViewConfiguration() {
        configureViews()
        buildViewHierarchy()
        setupConstraints()
    }
}
