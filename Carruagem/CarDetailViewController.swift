import UIKit

class CarDetailViewController: UIViewController {
    
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
    var cars = ["car0", "car1", "car2", "car3", "car4", "car5", "car6", "car7", "car8", "car9"]
    
    private var presenter: GaragePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupPresenter()
        getCarDescription()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buildDetails()
        buildCarsImages()
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
            self.build(data: data)
        }
    }
    
    func buildCarsImages() {
        if let carImage = cars.randomElement() {
            let bundlePath = Bundle.main.path(forResource: carImage, ofType: "jpg")
            detailImage.image = UIImage(contentsOfFile: bundlePath ?? "car0")
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
