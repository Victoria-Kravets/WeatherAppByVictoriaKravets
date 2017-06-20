//
//  Weather.swift
//  Weather by Victoria Kravets
//
//  Created by Viktoria on 7/25/16.
//  Copyright © 2016 Viktoria. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    fileprivate var _lat: String!
    fileprivate var _long: String!
    fileprivate var _temp: String!
    fileprivate var _city: String!
    fileprivate var _data: String!
    fileprivate var _weatherUrl: String!
    fileprivate var _icon: String!
    fileprivate var _humidity: String!
    fileprivate var _wind: String!
    open var cityName : String!
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
        }
        return _humidity
    }
    var wind: String {
        if _wind == nil {
            _wind = ""
        }
        return _wind
    }
    var lat: String {
        return _lat
    }
    var long: String {
        return _long
    }
    
    var temp: String {
        if _temp == nil {
            _temp = ""
        }
        return _temp
    }
    var city: String {
        
        if _city == nil {
            _city = ""
        }
        
        return _city
    }
    var data: String {
        return _data
    }
    var icon: String {
        if _icon == nil {
            _icon = ""
        }
        
        return _icon
    }
    init(city: String) {
       _city = city

        _weatherUrl = "\(BASE_URL)\(self.city)\(REG)\(APP_ID)"
        
    }
    init() {
    }
    func downloadWeather(_ completed: @escaping DownloadComplete) {
        let url = URL(string: _weatherUrl)!
        Alamofire.request(url).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let temp = dict["main"]?["temp"] as? Double {
                    let t = round(temp - 273.0)
                    self._temp = "\(t)"
                    print(self._temp)
                }
                
                if let city = dict["name"] as? String {
                    self._city = city
                    print(self._city)
                }
                if let weatherArray = dict["weather"] as?  Array<Dictionary<String, Any>>{
                    if let iconStr = weatherArray[0] as? Dictionary<String, Any>{
                        if let imgCode = iconStr["icon"] as? String{
                            self._icon = imgCode
                        }
                    }
                }
                if let windSpeed = dict["wind"]?["speed"] as? Double {
                    self._wind = "\(windSpeed)"
                }
                if let hum = dict["main"]?["humidity"] as? Double {
                    let h = round(hum)
                    self._humidity = "\(h)"
                }
                
            }
            completed()
        }
    }
    
}
