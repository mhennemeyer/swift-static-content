import Foundation

public struct InformationSection {
    public init(title: String? = nil, items: [InformationItem] = [InformationItem]()) {
        self.title = title
        self.items = items
    }
    
    var title: String? = nil
    var items = [InformationItem]()
    
    func item(for index: Int) -> InformationItem {
        guard index < items.count else { return InformationItem() }
        return items[index]
    }
}
