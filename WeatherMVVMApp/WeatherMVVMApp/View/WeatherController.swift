//
//  WeatherController.swift
//  WeatherMVVMApp
//
//  Created by param on 6/13/19.
//  Copyright © 2019 param. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherController: UIViewController {
    
    var arrayCityWeather = [WeatherInfo]()
    let cellIdentifier = "CustomWeatherCellIdentifier"
    
    @IBOutlet weak var tblViewWeatherList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = WeatherViewModel()
        
        viewModel.getWeatherDataForCity(cityInfo: CityInfo(cityId: Constant.CityIds.London.rawValue)) { (weatherInfo) in
            self.arrayCityWeather.append(weatherInfo)
            self.reloadData()
        }
        
        viewModel.getWeatherDataForCity(cityInfo: CityInfo(cityId: Constant.CityIds.NewJersy.rawValue)) { (weatherInfo) in
            self.arrayCityWeather.append(weatherInfo)
            self.reloadData()
        }
        
        viewModel.getWeatherDataForCity(cityInfo: CityInfo(cityId: Constant.CityIds.Tokyo.rawValue)) { (weatherInfo) in
            self.arrayCityWeather.append(weatherInfo)
            self.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    func reloadData(){
        DispatchQueue.main.async {
            self.tblViewWeatherList.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constant.SegueId.DetailVCSegue.rawValue{
            let viewController:DetailViewController = segue.destination as! DetailViewController
            viewController.weatherInfo = self.arrayCityWeather[sender as! Int]
        }
    }
    
}

extension WeatherController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayCityWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? WeatherCustomCell
        
        let weatherInfo = self.arrayCityWeather[indexPath.row]
        cell?.lblCityName.text                  = weatherInfo.cityName
        cell?.lblCityTemperature.text         = weatherInfo.cityTemperature
        
        let url = URL(string: Constant.AppKeyAndUrls.imageUrl.rawValue + weatherInfo.cityWeatherIcon + ".png")
        cell?.imgViewWeatherIcon.kf.setImage(with: url)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: Constant.SegueId.DetailVCSegue.rawValue, sender: indexPath.row)
    }
}

class WeatherCustomCell: UITableViewCell {
    
    @IBOutlet weak var imgViewWeatherIcon: UIImageView!
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblCityTemperature: UILabel!
    
}
