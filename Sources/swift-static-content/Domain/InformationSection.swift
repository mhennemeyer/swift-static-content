import Foundation

struct InformationSection {
    var title: String? = nil
    var items = [InformationItem]()
    
    func item(for index: Int) -> InformationItem {
        guard index < items.count else { return InformationItem() }
        return items[index]
    }
}
