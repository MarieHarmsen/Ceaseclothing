import UIKit

class CreditViewController: UIViewController {

    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelOne: UILabel!
    @IBOutlet private weak var labelTwo: UILabel!
    @IBOutlet private weak var labelThree: UILabel!
    @IBOutlet private weak var labelFour: UILabel!

    private let sharedAppearance = AppearanceHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        setUpView()
    }

    private func setUpView() {
        labelTitle.text = CommonStrings.creditTitle
        labelOne.text = CommonStrings.creditListOne
        labelTwo.text = CommonStrings.creditListTwo
        labelThree.text = CommonStrings.creditListThree
        labelFour.text = CommonStrings.creditListFour

        labelTitle.font = sharedAppearance.headingBoldFont(withSize: 24)
        labelOne.font = sharedAppearance.descriptionFont(withSize: 18)
        labelTwo.font = sharedAppearance.descriptionFont(withSize: 18)
        labelThree.font = sharedAppearance.descriptionFont(withSize: 18)
        labelFour.font = sharedAppearance.descriptionFont(withSize: 18)
    }
}
