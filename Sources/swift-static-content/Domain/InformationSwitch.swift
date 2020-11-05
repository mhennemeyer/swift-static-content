import Foundation

public struct InformationSwitch {
    public init(action: @escaping (Bool) -> Void, isOn: Bool) {
        self.action = action
        self.isOn = isOn
    }
    
    let action: (Bool) -> Void
    let isOn: Bool
}
