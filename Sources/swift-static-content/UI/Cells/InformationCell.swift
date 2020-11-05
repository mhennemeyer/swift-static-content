import UIKit

protocol InformationCell where Self: UITableViewCell {
    func configure(_ informationItem: InformationItem)
    func configured(_ informationItem: InformationItem) -> InformationCell
}

extension InformationCell {
    func configured(_ informationItem: InformationItem) -> InformationCell {
        configure(informationItem)
        return self
    }
}
