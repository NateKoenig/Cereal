//
//  ViewController.swift
//  Cerial
//
//  Created by Nathan Koenig on 6/3/21.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var vwDropDown:UIView!
    @IBOutlet weak var lblTitle:UILabel!
    
    let dropDown = DropDown()
    
    let tickersArray = [
        "TSLA",
        "BTC",
        "ETC",
        "DOGE"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTitle.text = "Select a ticker"
        dropDown.anchorView = vwDropDown
        dropDown.dataSource = tickersArray
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.lblTitle.text = tickersArray[index]
        }
    }

    @IBAction func showTickersOptions(_ sender:Any) {
        dropDown.show()
    }

}

