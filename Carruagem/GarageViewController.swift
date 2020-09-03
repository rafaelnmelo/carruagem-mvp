import UIKit
import Alamofire

class GarageViewController: UITableViewController {

    @IBOutlet var tableview: UITableView!
    
    var template = [CarTemplate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTemplate()
        tableview.register(UINib(nibName: "GenericCellTableViewCell", bundle: nil), forCellReuseIdentifier: "templateCell")
    }
    
    func getTemplate() {
        let presenter = GaragePresenter()
//        presenter.setViewDelegate(reference: self)
        presenter.getCarTemplate(by: "59")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return template.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let templateCell = tableView.dequeueReusableCell(withIdentifier: "templateCell", for: indexPath) as? GenericCellTableViewCell {
            templateCell.setTemplate(name: self.template[indexPath.row].name, code: self.template[indexPath.row].code)
            return templateCell
        }
        return UITableViewCell()
    }
}
    


