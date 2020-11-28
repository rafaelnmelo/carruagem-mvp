import UIKit

class GenericCellTableViewCell: UITableViewCell {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var code: UILabel!
    
    var cars = ["car0", "car1", "car2", "car3", "car4", "car5", "car6", "car7", "car8", "car9"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func buildCarsImages(carImage: String?) {
        let bundlePath = Bundle.main.path(forResource: carImage, ofType: "jpg")
        detailImage.image = UIImage(contentsOfFile: bundlePath ?? "car0")
        detailImage.layer.cornerRadius = detailImage.frame.height/2
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
