import UIKit

class InformationBigLabelCell: UITableViewCell, InformationCell {
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(_ informationItem: InformationItem) {
        bigLabel.text = informationItem.text
        titleLabel.text = informationItem.title
        subtitleLabel.text = informationItem.subtitle
        let interactive = informationItem.isActionable
        accessoryType = interactive ? .disclosureIndicator : .none
        selectionStyle = interactive ? .default : .none
    }
}
