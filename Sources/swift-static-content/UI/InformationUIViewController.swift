import UIKit
import swift_toolbox
import swift_crayons

public class InformationUIViewController: UITableViewController, InformationViewController {
    
    public static func ctrl(entryItem: InformationItem) -> InformationUIViewController {
        let ctrl = InformationUIViewController.fromStoryboard(bundle: .module, name: nil)
        ctrl.entryItem = entryItem
        return ctrl  
    }
    
    var entryItem: InformationItem!
    
    // MARK: - Life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navigationTitle
        tableView.register(InformationTextCell.nib(Bundle.module), forCellReuseIdentifier: InformationTextCell.nibName)
        tableView.register(InformationSwitchCell.nib(Bundle.module), forCellReuseIdentifier: InformationSwitchCell.nibName)
        tableView.register(InformationImageCell.nib(Bundle.module), forCellReuseIdentifier: InformationImageCell.nibName)
        tableView.register(InformationBigLabelCell.nib(Bundle.module), forCellReuseIdentifier: InformationBigLabelCell.nibName)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        setupNavBar()
        
        view.backgroundColor = Crayon.primaryColor
        tableView.backgroundColor = Crayon.primaryDarkerColor
        tableView.tintColor = Crayon.secondaryColor
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Crayon.colorize(view: view)
        Crayon.colorize(bar: navigationController?.navigationBar)
    }
    
    // MARK: - UIHelper
    
    private func setupNavBar() {
        guard (navigationController?.viewControllers.count ?? 1) == 1 else { return }
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
        navigationController?.navigationBar.tintColor = Crayon.secondaryColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : Crayon.secondaryColor]
    }
    
    // MARK: - Actions
    
    @objc private func close() {
        dismiss(animated: true)
    }
    
    // MARK: - TableView
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        informationSections.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        informationSection(index: section).items.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        InformationCells.cell(tableView: tableView, informationItem: informationItem(for: indexPath))
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        informationSection(index: section).title
    }
    
    public override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        Crayon.colorize(cell: cell)
    }
    
    public override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = Crayon.secondaryColor
        }
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = informationItem(for: indexPath)
        
        if let key = item.actionKey, let action = InformationActions.action(key: key) {
            action(self)
            return
        }
        
        if let sections = item.details {
            let nextItem = InformationItem(title: item.title, details: sections)
            let ctrl = Self.fromStoryboard()
            ctrl.entryItem = nextItem
            navigationController?.pushViewController(ctrl, animated: true)
            return
        }
    }
    
    // MARK: - Key Commands
    
    public override var keyCommands: [UIKeyCommand]? {
        var commands = [UIKeyCommand]()
        
        commands.append(
            UIKeyCommand(input: UIKeyCommand.inputEscape, modifierFlags: [] , action: #selector(close)).nonRepeating
        )
        
        return commands
    }
}


