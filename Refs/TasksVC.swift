//
//  TasksVC.swift
//  Refs
//
//  Created by Екатерина Никифорова on 28.12.2023.
//

import UIKit

final class TasksVC: UIViewController {
    
    var mainScroll: UIScrollView? = nil

    

    private let tasksLabel: UILabel = {
        let control = UILabel()
        control.text = "задания"
        control.textAlignment = .center
        control.textColor = .black
        control.numberOfLines = 0
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
       
//        setupViews()
//        setConstraints()
        
        // Create a UIScrollView
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .lightGray
        scrollView.isScrollEnabled = true
        
        self.mainScroll = scrollView
        configureUI(scrollView: scrollView)
    }
    
    private func setupViews() {
    }
    
    
    
    func configureUI(scrollView: UIScrollView) {
        
        // Create a banner
        let gallery = UIImageView()
        gallery.image = UIImage(named: "M_MainGallery")
        gallery.translatesAutoresizingMaskIntoConstraints = false
        gallery.contentMode = .scaleAspectFill
        gallery.clipsToBounds = true
        gallery.layer.cornerRadius = 8
        
        
        // Create a UIStackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 62
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.spacing = 24
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(textStackView)
        
        let taskTypes = UIImageView()
        taskTypes.image = UIImage(named: "M_TaskTypes")
        taskTypes.translatesAutoresizingMaskIntoConstraints = false
        taskTypes.contentMode = .scaleAspectFill
        taskTypes.clipsToBounds = true
        taskTypes.layer.cornerRadius = 8
        
        // Covers section
        let howToPlay = UIImageView()
        howToPlay.image = UIImage(named: "M_HowToPlay")
        howToPlay.translatesAutoresizingMaskIntoConstraints = false
        howToPlay.contentMode = .scaleAspectFill
        howToPlay.clipsToBounds = true
        howToPlay.layer.cornerRadius = 8
        
        // Interview section
        let answerRow = UIImageView()
        answerRow.image = UIImage(named: "A_AnswerRow")
        answerRow.translatesAutoresizingMaskIntoConstraints = false
        answerRow.contentMode = .scaleAspectFill
        answerRow.clipsToBounds = true
        
//         Best videos section
//         Configure section heading
        let collectionHeading = UILabel()
        collectionHeading.text = "собери свою коллекцию рефененсов!"
        collectionHeading.numberOfLines = 2
        collectionHeading.font = UIFont.boldSystemFont(ofSize: 24)
        collectionHeading.textColor = .white
        collectionHeading.translatesAutoresizingMaskIntoConstraints = false
        collectionHeading.textAlignment = .center
        
        let collectionText = UILabel()
        collectionText.text = "И искать вдохновение на пинтересте больше не понадобится"
        collectionText.numberOfLines = 3
        collectionText.font = UIFont.boldSystemFont(ofSize: 22)
        collectionText.textColor = .white
        collectionText.translatesAutoresizingMaskIntoConstraints = false
        collectionText.textAlignment = .center


        
        // Add cards to the scroll view
        stackView.addArrangedSubview(gallery)
        stackView.addArrangedSubview(taskTypes)
        stackView.addArrangedSubview(howToPlay)
        stackView.addArrangedSubview(answerRow)
        stackView.addArrangedSubview(textStackView)
        
        textStackView.addArrangedSubview(collectionHeading)
        textStackView.addArrangedSubview(collectionText)
        
        // Add the scroll view to the view
        view.addSubview(scrollView)

        
        // Configure AutoLayout for the scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
       scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.heightAnchor.constraint(equalToConstant: 2000).isActive = true

        // Configure AutoLayout for the cards
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            gallery.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            gallery.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            gallery.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            gallery.heightAnchor.constraint(equalToConstant: 550),
            
//            collectionHeading.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
//            collectionHeading.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            taskTypes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            taskTypes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            taskTypes.heightAnchor.constraint(equalToConstant: 628),
            
            howToPlay.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            howToPlay.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            howToPlay.heightAnchor.constraint(equalToConstant: 324),
            
            answerRow.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            answerRow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            answerRow.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    }
