import UIKit

public struct InformationItem {
    public init(title: String? = nil, subtitle: String? = nil, text: String? = nil, imageKey: String? = nil, details: [InformationSection]? = nil, switch aswitch: InformationSwitch? = nil, actionKey: String? = nil, highlight: Bool? = false) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.imageKey = imageKey
        self.details = details
        self.switch = aswitch
        self.actionKey = actionKey
        self.highlight = highlight
    }
    
    var title: String? = nil
    var subtitle: String? = nil
    var text: String? = nil
    var imageKey: String? = nil
    var details: [InformationSection]? = nil
    var `switch`: InformationSwitch? = nil
    var actionKey: String? = nil
    
    var highlight: Bool? = false
    
    var isHighlight: Bool {
        highlight ?? false
    }
    
    var isActionable: Bool {
       hasAction || hasDetails
    }
    
    var hasAction: Bool {
        actionKey != nil
    }
    
    var hasDetails: Bool {
        guard let details = details else { return false }
        return !details.isEmpty
    }
    
    var image: UIImage? {
        UIImage(named: imageKey ?? "") ?? UIImage(systemName: imageKey ?? "")
    }
}
