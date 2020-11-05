import UIKit

public struct InformationActions {
    static var mapping = [String: (UIViewController?) -> Void]()
    
    static func action(key: String) -> ((UIViewController?) -> Void)? {
        mapping[key]
    }
    
    public static func add(_ key: String, _ action: @escaping (UIViewController?) -> Void) {
        mapping[key] = action
    }
}
