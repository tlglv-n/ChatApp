//
//  UIKit+Extensions.swift
//  ChatApp
//
//  Created by Nurikk T. on 21.07.2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = String(hexWithoutSymbol.dropFirst())
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            var red, green, blue: CGFloat
            red = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
            green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
            blue = CGFloat(hexNumber & 0x0000ff) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0) // Return black color if the hex string is invalid
        }
    }
}
extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        let name = String(describing: cellType)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T else {
            fatalError("\(T.self) is expected to have reusable identifier: \(String(describing: cellType))")
        }
        return cell
    }
}
