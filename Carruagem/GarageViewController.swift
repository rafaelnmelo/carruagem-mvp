import UIKit
import Alamofire

class GarageViewController: UIViewController {
    
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "garageBackground")
        image.contentMode = .scaleToFill
        image.alpha = 0.4
        return image
    }()
    
    @IBOutlet private var tableView: UITableView!
    
    private var presenter: GaragePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        setupPresenter()
        getTemplate()
    }
    
    private func setupTableView() {
        tableView.backgroundView = backgroundImage
        tableView.register(UINib(nibName: "GenericCell", bundle: nil),
                           forCellReuseIdentifier: "GenericCellTableViewCell")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let yearTableView = UIStoryboard(name: "YearTableViewController", bundle: nil).instantiateViewController(withIdentifier: "YearTableViewController") as? YearTableViewController {
            if let cell = tableView.cellForRow(at: indexPath) as? GenericCellTableViewCell {
                yearTableView.carModel = cell.code.text
                yearTableView.carImage = cell.detailImage.image
                navigationController?.pushViewController(yearTableView, animated: true)
            }
        }
    }
}

extension GarageViewController: UITableViewDataSource {
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
