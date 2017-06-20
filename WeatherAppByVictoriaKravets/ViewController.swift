//
//  ViewController.swift
//  Weather by Victoria Kravets
//
//  Created by Viktoria on 7/21/16.
//  Copyright © 2016 Viktoria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var datdaLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var backBtn: UIButton!
   // var timeFormatter: NSDateFormatter!
    var dateFormatter: DateFormatter!
    var name: String!
    var isSomethingEnabled: Bool!

    var weather: Weather!
    override func viewDidLoad() {
        super.viewDidLoad()
       // weather = Weather()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        datdaLbl.text = dateFormatter.string(from: Date())
        backBtn.layer.cornerRadius = 10

        weather.downloadWeather {
         self.updateUI()
        }
    }

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    func updateUI(){
        locationLbl.text = weather.city
        print(weather.city)
        let temperature = weather.temp
        print(weather.temp)
        tempLbl.text = "\(temperature)" + "°"
        mainImg.image = UIImage(named: "\(weather.icon)")
        let windSpeed = weather.wind
        wind.text = "\(windSpeed)" + "m/s"
        let hum = weather.humidity
        humidity.text = "\(hum)" + "%"
    }

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

