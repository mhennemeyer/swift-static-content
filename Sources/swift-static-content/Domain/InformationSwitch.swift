import Foundation

public struct InformationSwitch {
    public init(action: @escaping (Bool) -> Void, isOn: Bool, isEnabled: Bool = true) {
        self.action = action
        self.isOn = isOn
        self.isEnabled = isEnabled
    }
    
    let action: (Bool) -> Void
    let isOn: Bool
    let isEnabled: Bool
}
