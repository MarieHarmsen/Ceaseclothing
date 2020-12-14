import UIKit
import SnapKit

class HeaderView: UITableViewHeaderFooterView {
    
    private var sharedAppearance = AppearanceHandler()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!

    func configure(title: String?, subTitle: String?) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setViewFontsAndColors()
        setUpConstraints()
        self.contentView.backgroundColor = sharedAppearance.whiteColour
    }

    func setViewFontsAndColors() {
        titleLabel.font = sharedAppearance.headingBoldFont(withSize: 22)
        subTitleLabel.font = sharedAppearance.descriptionFont(withSize: 18)
    }

    func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
          make.width.equalToSuperview()
          make.centerX.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
          make.width.equalToSuperview()
          make.centerX.equalToSuperview()
          make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
    }
}
