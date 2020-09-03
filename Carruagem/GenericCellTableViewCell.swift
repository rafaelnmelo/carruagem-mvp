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
    
    func setTemplate(name: String, code: Int) {
        self.name.text = name
        self.code.text = "\(code)"
    }
    
    func setYear(name: String, code: String) {
        self.name.text = name
        self.code.text = code
    }
    
}
