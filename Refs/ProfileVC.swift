//
//  ProfileVC.swift
//  Refs
//
//  Created by Екатерина Никифорова on 28.12.2023.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViews()
        setConstraints()
    }
    

    private let profileLabel: UILabel = {
        let control = UILabel()
        control.text = "профиль"
        control.textAlignment = .center
        control.textColor = .black
        control.numberOfLines = 0
        return control
    }()
    
    private func setupViews() {
        view.addSubview(profileLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor),
            profileLabel.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor),
            profileLabel.pinCenterX(to: view)
        ])
    }

}
