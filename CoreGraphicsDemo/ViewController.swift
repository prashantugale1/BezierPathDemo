//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by Prashant Ugale on 01/06/16.
//  Copyright © 2016 Leftshift Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func minusButtonClicked(sender: AnyObject) {
        if counterView.counter > 0 {
            counterView.counter -= 1
        }
        counterLabel.text = "\(counterView.counter)"
    }
    

    @IBAction func plusButtonClikced(sender: AnyObject) {
        if counterView.counter < counterView.noOfPercentage {
            counterView.counter += 1
        }
        counterLabel.text = "\(counterView.counter)"
    }
}

