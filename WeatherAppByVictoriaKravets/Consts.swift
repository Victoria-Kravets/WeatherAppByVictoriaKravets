//
//  Consts.swift
//  Weather by Victoria Kravets
//
//  Created by Viktoria on 7/25/16.
//  Copyright © 2016 Viktoria. All rights reserved.
//

import Foundation

//let URL_BASE = "http://http://openweathermap.org/"
//let URL_LOCATION = "/api.openweathermap.org/data/2.5/forecast?callback=?&id=698740&units=metric&appid=b1b15e88fa797225412429c1c50c122a/"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="
let REG = ",ua"
let APP_ID = "&APPID=8271eb5930b835194748ab29bb0e33dd"
let LAT = "lat="
let LONG = "&lon="

typealias DownloadComplete = () -> ()