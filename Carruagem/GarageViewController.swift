import UIKit
import Alamofire

class GarageViewController: UITableViewController {

    var presenter = GaragePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getBrand()
    }
}

