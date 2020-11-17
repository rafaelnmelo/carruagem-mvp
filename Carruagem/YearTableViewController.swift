import UIKit
import Alamofire

class YearTableViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    
    private var presenter: GaragePresenter?
    var manufactureYear: GenericCellTableViewCell.Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
