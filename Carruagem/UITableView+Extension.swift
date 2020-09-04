import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ reusable: T.Type) where T: Reusable {
        register(reusable, forCellReuseIdentifier: T.identifier)
    }
    
    func dequeueReusable<T: UITableViewCell>(_ type: T.Type,
                                             for indexPath: IndexPath) -> T where T: Reusable {
        
        guard let reusable = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
            }
         return reusable

    }
}
