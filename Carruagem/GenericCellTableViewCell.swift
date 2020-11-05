import UIKit

class GenericCellTableViewCell: UITableViewCell {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var code: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailImage.layer.cornerRadius = detailImage.frame.height/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension GenericCellTableViewCell {
    struct Data {
//        var detailImage: UIImageView!
        var name: String?
        var code: String?
    }
    
    func build(data: Data) {
        self.name.text = data.name ?? ""
        self.code.text = data.code ?? ""
    }
}
