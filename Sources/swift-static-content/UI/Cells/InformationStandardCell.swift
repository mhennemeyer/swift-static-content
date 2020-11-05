import UIKit

class InformationStandardCell: UITableViewCell, InformationCell {
    func configure(_ informationItem: InformationItem) {
        textLabel?.text = informationItem.title
        imageView?.image = informationItem.image
        detailTextLabel?.text = informationItem.subtitle
        detailTextLabel?.numberOfLines = 2
        let interactive = informationItem.isActionable
        accessoryType = interactive ? .disclosureIndicator : .none
        selectionStyle = interactive ? .default : .none
    }
}
