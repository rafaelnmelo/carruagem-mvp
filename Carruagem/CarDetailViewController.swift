import UIKit

class CarDetailViewController: UIViewController {
    
    @IBOutlet var detailsView: UIView!
    @IBOutlet var value: UILabel!
    @IBOutlet var brand: UILabel!
    @IBOutlet var model: UILabel!
    @IBOutlet var modelyear: UILabel!
    @IBOutlet var fuel: UILabel!
    @IBOutlet var fipeCode: UILabel!
    @IBOutlet var referenceMonth: UILabel!
    @IBOutlet var vehicleType: UILabel!
    @IBOutlet var fuelInitials: UILabel!
    @IBOutlet var detailImage: UIImageView!
    
    var carModel: String?
    var manufactureYear: String?
    var carImage: UIImage?
    var cars = ["car0", "car1", "car2", "car3", "car4", "car5", "car6", "car7", "car8", "car9"]
    
    private var presenter: GaragePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = .clear
        setupPresenter()
        getCarDescription()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buildDetails()
        buildCarImage()
    }
    
    private func setupPresenter() {
        presenter = GaragePresenter()
        presenter?.delegate = self
    }
    
    private func getCarDescription() {
        guard let model = self.carModel else {return}
        guard let year = self.manufactureYear else {return}
        self.presenter?.getCarDescription(by: model, yearCode: year)
    }
    
    private func buildDetails() {
        if let data = self.presenter?.getCarDetail() {
            build(data: data)
            detailsView.layer.cornerRadius = detailsView.frame.height/16
        }
    }
    
    func buildCarImage() {
        if let carImage = self.carImage {
            detailImage.image = carImage
            detailImage.layer.cornerRadius = detailImage.frame.height/4
        }
    }
}

extension CarDetailViewController {
    struct Data {
        var value: String?
        var brand: String?
        var model: String?
        var modelYear: Int?
        var fuel: String?
        var fipeCode: String?
        var referenceMonth: String?
        var vehicleType: Int?
        var fuelInitials: String?
    }
    
    func build(data: Data) {
        self.value.text = data.value ?? ""
        self.brand.text = data.brand ?? ""
        self.model.text = data.model ?? ""
        self.modelyear.text = data.modelYear?.description ?? ""
        self.fuel.text = data.fuel ?? ""
        self.fipeCode.text = data.fipeCode ?? ""
        self.referenceMonth.text = data.referenceMonth ?? ""
        self.vehicleType.text = data.vehicleType?.description ?? ""
        self.fuelInitials.text = data.brand ?? ""
    }
}

extension CarDetailViewController: GaragePresenterDelegate {
    func fetchSuccess() {
        self.buildDetails()
    }
}
