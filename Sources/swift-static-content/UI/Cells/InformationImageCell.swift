import UIKit

class InformationImageCell: UITableViewCell, InformationCell {
    var informationItem: InformationItem!
    
    @IBOutlet weak var informationImageView: UIImageView!

    func configure(_ informationItem: InformationItem) {
        self.informationItem = informationItem
        informationImageView.image = informationItem.image
        let interactive = informationItem.isActionable
        accessoryType = interactive ? .disclosureIndicator : .none
        selectionStyle = interactive ? .default : .none
    }
}

