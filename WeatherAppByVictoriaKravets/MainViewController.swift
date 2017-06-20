//
//  MainViewController.swift
//  Weather by Victoria Kravets
//
//  Created by Viktoria on 7/26/16.
//  Copyright © 2016 Viktoria. All rights reserved.
//

import UIKit
class MainViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var texyField: UITextField!
    
     var weather: Weather!
    override func viewDidLoad() {
        super.viewDidLoad()
        texyField.delegate = self
        searchBtn.layer.cornerRadius = 10
        weather = Weather()
        texyField.returnKeyType = UIReturnKeyType.done
        
    }
  
    
   

   
    
    @IBAction func searchBtnPressed(_ sender: AnyObject) {
        texyField.resignFirstResponder()
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToViewControllerSeque" {
            let controller: ViewController = (segue.destination as! ViewController)
        
            controller.weather = Weather(city: texyField.text!)
            
        }
    }
    
    
    
}
