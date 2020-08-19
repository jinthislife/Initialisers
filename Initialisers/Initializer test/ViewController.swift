//
//  ViewController.swift
//  Initializer test
//
//  Created by Jin Lee on 18/8/20.
//  Copyright © 2020 Jin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func codeButtonTapped(_ sender: Any) {
        let vc = CodeBasedViewController(data: "Hello CodeVC")
        present(vc, animated: true)
    }
    
    @IBAction func xibButtonTapped(_ sender: Any) {
//        let vc = XIBBasedViewController(nibName: "XIBBasedViewController", bundle: nil)
        let vc = XIBBasedViewController(data: "Hello XIBVC")
        present(vc, animated: true)
    }
    
    @IBAction func storyboardButtonTapped(_ sender: Any) {
    
    }
    
    @IBSegueAction func makeStoryBoardVC(_ coder: NSCoder) -> StoryboardViewController? {
        //        func makeStoryboardViewController(coder: NSCoder, sender: Any?, segueIdentifier: String?) -> UIViewController?
        return StoryboardViewController(coder: coder, titleString: "hello storyboard")
    }

    @IBAction func storyboardNoSegueButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: StoryboardViewController.self)) { coder in
            return StoryboardViewController(coder: coder, titleString: "hello storyboard created by code")
        }
        present(vc, animated: true)
    }
    
    @IBAction func convenienceInitTapped(_ sender: Any) {
        let vc = ConvenienceXIBViewController(initialData: "Hello VC using convenience initialiser")
        present(vc, animated: true)
    }
    
}

