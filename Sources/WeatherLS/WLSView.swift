//
//  WLSView.swift
//  
//
//  Created by Noah Little on 27/2/2022.
//

import UIKit
import WeatherLSC

final class WLSView: UIView {
    
    var image_view: UIImageView!
    var temp_label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        image_view = UIImageView(frame: CGRect.zero)
        image_view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image_view)
        
        temp_label = UILabel(frame: CGRect.zero)
        temp_label.translatesAutoresizingMaskIntoConstraints = false
        temp_label.textAlignment = .center
        temp_label.font = .systemFont(ofSize: 28)
        addSubview(temp_label)
        
        configureConstrains()
        updateWeather()
    }
    
    func configureConstrains() {
        image_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image_view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        image_view.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        image_view.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20).isActive = true
        
        temp_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        temp_label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        temp_label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        temp_label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func updateWeather() {
        PDDokdo.sharedInstance().refreshWeatherData()
        image_view.image = PDDokdo.sharedInstance().currentConditionsImage
        temp_label.text = PDDokdo.sharedInstance().currentTemperature
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
