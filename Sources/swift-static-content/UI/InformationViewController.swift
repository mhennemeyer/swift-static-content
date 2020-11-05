import Foundation

protocol InformationViewController {
    var entryItem: InformationItem! { get set }
    var navigationTitle: String? { get }
    var informationSections: [InformationSection] { get }
    func informationSection(index: Int) -> InformationSection
    func informationItem(for indexPath: IndexPath) -> InformationItem
}

extension InformationViewController {
    var navigationTitle: String? {
        entryItem.title
    }
    
    var informationSections: [InformationSection] {
        entryItem.details ?? [InformationSection]()
    }
    
    func informationSection(index: Int) -> InformationSection {
        guard index < informationSections.count else { return InformationSection() }
        
        return informationSections[index]
    }
    
    func informationItem(for indexPath: IndexPath) -> InformationItem {
        informationSection(index: indexPath.section).item(for: indexPath.row)
    }
    
}
