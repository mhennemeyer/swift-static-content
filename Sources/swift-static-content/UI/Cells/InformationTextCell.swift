import UIKit

class InformationTextCell: UITableViewCell, InformationCell {
    var informationItem: InformationItem!
    
    @IBOutlet weak var multilineLabel: UILabel!
    
    func configure(_ informationItem: InformationItem) {
        self.informationItem = informationItem
        multilineLabel.text = informationItem.text
        let interactive = informationItem.isActionable
        let highlight = informationItem.isHighlight
        let hasAction = informationItem.hasAction
        accessoryType = interactive ? .disclosureIndicator : .none
        selectionStyle = interactive ? .default : .none
        multilineLabel.font = highlight ? multilineLabel.font.withWeight(.bold) : multilineLabel.font.withWeight(.regular)
        
    }
}

