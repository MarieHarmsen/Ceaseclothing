import Foundation
import UIKit

struct AppearanceHandler {
    func headingBoldFont(withSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }

    func descriptionFont(withSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.thin)
    }

    var whiteColour: UIColor {
        return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }

    var headingText: UIFont {
        return UIFont(name: "Futura", size: 24) ?? UIFont()
    }

    var mainColour: UIColor {
        return UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
    }
}
