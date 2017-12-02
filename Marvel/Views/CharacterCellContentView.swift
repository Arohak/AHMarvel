//
//  CharacterCell.swift
//  Marvel
//
//  Created by Thiago Lioy on 18/12/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit
import PureLayout

final class CharacterCellContentView: UIView {
    
    lazy var thumbImageView: UIImageView = {
        let view = UIImageView.newAutoLayout()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel.newAutoLayout()
        view.textAlignment = .center
        view.textColor = UIColor.white
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel.newAutoLayout()
        view.textAlignment = .center
        view.textColor = UIColor.red
        view.font = UIFont.systemFont(ofSize: 13)
        view.textAlignment = .left
        view.numberOfLines = 0
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharacterCellContentView: ViewConfiguration {
    
    func configureViews() {
        backgroundColor = ColorPalette.black
    }
    
    func buildViewHierarchy() {
        addSubview(thumbImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        let inset: CGFloat = 10
        let width: CGFloat = 50
        
        thumbImageView.autoAlignAxis(toSuperviewAxis: .horizontal)
        thumbImageView.autoPinEdge(toSuperviewEdge: .left, withInset: inset)
        thumbImageView.autoSetDimensions(to: CGSize(width: width, height: width))
        
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: inset)
        titleLabel.autoPinEdge(.left, to: .right, of: thumbImageView, withOffset: inset)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: inset)
        
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel)
        descriptionLabel.autoPinEdge(.left, to: .right, of: thumbImageView, withOffset: inset)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .right, withInset: inset)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: inset)
    }
}

extension CharacterCellContentView {
    
    func setup(with item: Character){
        titleLabel.text         = item.name
        descriptionLabel.text   = item.bio.isEmpty ? "No description" : item.bio
        thumbImageView.download(image: item.thumImage?.fullPath() ?? "")
    }
}

