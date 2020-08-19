//
//  StoroyboardViewController.swift
//  Initializer test
//
//  Created by Jin Lee on 18/8/20.
//  Copyright © 2020 Jin Lee. All rights reserved.
//

import UIKit

class StoryboardViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    private var titleString: String

    init?(coder: NSCoder, titleString: String) {
        self.titleString = titleString
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleString
        // Do any additional setup after loading the view.
    }

    @IBAction func tapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
