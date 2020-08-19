//
//  ProgrammaticViewController.swift
//  Initializer test
//
//  Created by Jin Lee on 18/8/20.
//  Copyright © 2020 Jin Lee. All rights reserved.
//

import UIKit


class CodeBasedViewController: UIViewController {
    
    private let data: String
    
    private lazy var label: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private lazy var btn: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    init(data: String, viewModel: String? = nil) {
        self.data = data
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Never will happen")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        label.text = data
    }
    
    func setupViews() {
        
        view.addSubview(label)
        view.addSubview(btn)
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 39).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func buttonTapped(sender: UIButton) {
        dismiss(animated: true)
    }
}
