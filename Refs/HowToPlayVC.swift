//
//  HowToPlayVC.swift
//  Refs
//
//  Created by Екатерина Никифорова on 28.12.2023.
//

import UIKit

class HowToPlayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViews()
        setConstraints()
    }
    

    private let playLabel: UILabel = {
        let control = UILabel()
        control.text = "как играть"
        control.textAlignment = .center
        control.textColor = .black
        control.numberOfLines = 0
        return control
    }()
    
    private func setupViews() {
        view.addSubview(playLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            playLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor),
            playLabel.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor),
            playLabel.pinCenterX(to: view)
        ])
    }

}
