import UIKit
import Alamofire

class GarageViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private var presenter: GaragePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        setupPresenter()
        getTemplate()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "GenericCell", bundle: nil), forCellReuseIdentifier: "GenericCellTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupPresenter() {
        presenter = GaragePresenter()
        presenter?.delegate = self
    }
    
    private func getTemplate() {
        presenter?.getCarTemplate()
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
        return self.presenter?.numberOfModelsRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GenericCellTableViewCell", for: indexPath) as? GenericCellTableViewCell {
            if let data = presenter?.modelForRow(at: indexPath) {
                cell.build(data: data)
                return cell
            }
        }
        return UITableViewCell()
    }
}
    


