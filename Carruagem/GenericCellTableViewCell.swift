import UIKit

class GenericCellTableViewCell: UITableViewCell {
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.layer.cornerRadius = 20
        return blurView
    }()
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var code: UILabel!
    
    var cars = ["car0", "car1", "car2", "car3", "car4", "car5", "car6", "car7", "car8", "car9"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.addSubview(blurView)
        stackView.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: stackView.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    
    func buildCarsImages(carImage: String?) {
        let bundlePath = Bundle.main.path(forResource: carImage, ofType: "jpg")
        detailImage.image = UIImage(contentsOfFile: bundlePath ?? "car0")
        detailImage.layer.cornerRadius = detailImage.frame.height/4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension GenericCellTableViewCell {
    struct Data {
        var name: String?
        var code: String?
        var image: String?
    }
    
    func build(data: Data) {
        self.name.text = data.name ?? ""
        self.code.text = data.code ?? ""
        
        if detailImage.image == nil {
            buildCarsImages(carImage: data.image)
        }
    }
}
