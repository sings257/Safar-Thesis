import UIKit

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 4
    let numberOfItemsPerRow = 15

    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    
    class func randomColor() -> UIColor {



        return UIColor.clear
    }
}
