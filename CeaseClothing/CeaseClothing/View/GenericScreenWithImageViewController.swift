import UIKit

class GenericScreenWithImageViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    private let sharedAppearance = AppearanceHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
    }

    public func configure(imageName: String, description: String) {
        imageView.image = UIImage(named: imageName)
        descriptionLabel.text = description
        descriptionLabel.font = sharedAppearance.descriptionFont(withSize: 18)
    }
}
