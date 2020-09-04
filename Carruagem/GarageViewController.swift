import UIKit
import Alamofire

class GarageViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private var presenter: GaragePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPresenter()
        getTemplate()
    }
    
    private func setupTableView() {
        tableView.register(GenericCellTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupPresenter() {
        presenter = GaragePresenter()
        presenter?.delegate = self
    }
    
    private func getTemplate() {
        presenter?.getCarTemplate(by: "59")
    }
}

extension GarageViewController: GaragePresenterDelegate {
    func fetchSuccess() {
        tableView.reloadData() /// Realimentar a tableview com todos seus métodos
    }
}

extension GarageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
}

extension GarageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusable(GenericCellTableViewCell.self, for: indexPath)
        if let data = presenter?.cellForRow(at: indexPath) {
            cell.build(data: data)
        }
        
        return cell
    }
    
    
}
    


