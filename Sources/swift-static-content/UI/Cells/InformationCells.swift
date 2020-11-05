import UIKit

enum InformationCells {
    static func cell(tableView: UITableView, informationItem: InformationItem) -> InformationCell {
        
        if informationItem.text != nil && informationItem.title != nil {
            return InformationBigLabelCell.from(tableView: tableView).configured(informationItem)
        }
        
        if informationItem.text != nil {
            return InformationTextCell.from(tableView: tableView).configured(informationItem)
        }
        
        if informationItem.switch != nil {
            return InformationSwitchCell.from(tableView: tableView).configured(informationItem)
        }
        
        if informationItem.title == nil && informationItem.image != nil {
            return InformationImageCell.from(tableView: tableView).configured(informationItem)
        }
        
        return InformationStandardCell(
            style: .subtitle,
            reuseIdentifier: nil)
            .configured(informationItem)
    }
}
