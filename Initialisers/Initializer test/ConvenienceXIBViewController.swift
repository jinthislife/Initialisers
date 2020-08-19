//
//  ConvenienceXIBViewController.swift
//  Initializer test
//
//  Created by Jin Lee on 19/8/20.
//  Copyright © 2020 Jin Lee. All rights reserved.
//

import UIKit

class ConvenienceXIBViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    private var initialData: String = ""
    
    convenience init(initialData: String) {
        // To call self.init(), every properties should have default values or be optionals
        self.init()
        self.initialData = initialData
        print("convenience init")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = initialData
    }

    @IBAction func buttonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
