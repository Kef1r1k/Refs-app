//
//  TasksVC.swift
//  Refs
//
//  Created by Екатерина Никифорова on 28.12.2023.
//

import UIKit

final class TasksVC: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupScrollView()
        setupStackView()
        addElementsToStackView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func addElementsToStackView() {
        let gallery = createImageView(named: "M_MainGallery")
        stackView.addArrangedSubview(gallery)

        let taskTypes = createImageView(named: "M_TaskTypes")
        stackView.addArrangedSubview(taskTypes)

        let howToPlay = createImageView(named: "M_HowToPlay")
        stackView.addArrangedSubview(howToPlay)

        let answerRow = createImageView(named: "A_AnswerRow")
        stackView.addArrangedSubview(answerRow)

        let collectionHeading = createLabel(text: "собери свою коллекцию рефененсов!", fontSize: 24)
        stackView.addArrangedSubview(collectionHeading)

        let collectionText = createLabel(text: "И искать вдохновение на пинтересте больше не понадобится", fontSize: 22)
        stackView.addArrangedSubview(collectionText)
    }
    
    private func createImageView(named imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func createLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
