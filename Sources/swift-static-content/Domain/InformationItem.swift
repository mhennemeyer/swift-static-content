import UIKit

struct InformationItem {
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
