import UIKit

class InformationSwitchCell: UITableViewCell, InformationCell {
    
    var informationItem: InformationItem!
    var switchAction: ((Bool) -> Void)?
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var aSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    func configure(_ informationItem: InformationItem) {
        self.informationItem = informationItem
        titleLabel.text = informationItem.title
        subtitleLabel.text = informationItem.subtitle
        iconView.image = informationItem.image
        aSwitch.isOn = (informationItem.switch?.isOn ?? false)
        
        let interactive = informationItem.isActionable
        accessoryType = interactive ? .disclosureIndicator : .none
        selectionStyle = interactive ? .default : .none
    }
    
    @IBAction func switchToggled() {
        informationItem.switch?.action(aSwitch.isOn)
    }
}
