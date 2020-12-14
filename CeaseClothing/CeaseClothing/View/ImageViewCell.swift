import UIKit
import SDWebImage

class ImageViewCell: UITableViewCell {
    private var sharedAppearance = AppearanceHandler()

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var images: UIImageView!
    @IBOutlet private weak var imagesView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setViewFontsAndColors()
        setUpView()
    }

    func configure(imageURL: URL, price: String?) {
        setUpImage(imageURL: imageURL)
        descriptionLabel.text = price
    }

    func setViewFontsAndColors() {
        descriptionLabel.font = sharedAppearance.descriptionFont(withSize: 18)
    }

    func setUpView() {
        images.layer.cornerRadius = CGFloat(Constants().cornerRadius)
    }

    func setUpImage(imageURL: URL) {
        images.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "ImagePlaceholder"))
    }
}
