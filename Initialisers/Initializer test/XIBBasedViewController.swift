//
//  XIBBasedViewController.swift
//  Initializer test
//
//  Created by Jin Lee on 18/8/20.
//  Copyright © 2020 Jin Lee. All rights reserved.
//

import UIKit

class XIBBasedViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    private let titleData: String
    
    init(data: String) {
        self.titleData = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = titleData
    }
    
    @IBAction func tapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
