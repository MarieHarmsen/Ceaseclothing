import UIKit

class HomeTableViewController: UITableViewController, HomeViewModelDelegate {
    private let sharedAppearance = AppearanceHandler()
    private let constants = Constants()
    private var viewModelDelegate: HomeViewModelDelegate?
    private var viewModel: HomeTableViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelDelegate = self
        viewModel = HomeTableViewModel(with: viewModelDelegate)
        getData()
    }

    func setUp() {
        registerViews()
        setUpViews()
    }

    func registerViews() {
        let searchCellNib = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(searchCellNib, forCellReuseIdentifier: "SearchCell")
        let imageCellNib = UINib(nibName: "ImageViewCell", bundle: nil)
        self.tableView.register(imageCellNib, forCellReuseIdentifier: "ImageViewCell")
        let headerNib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }

    func setUpViews() {
        self.title = CommonStrings.appTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: sharedAppearance.headingText]
        let rightButtonItem = UIBarButtonItem.init(
              title: CommonStrings.credits,
              style: .done,
              target: self,
              action: #selector(rightButtonAction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.navigationController?.navigationBar.tintColor = sharedAppearance.mainColour
    }

    @objc func rightButtonAction(sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "CreditViewController", bundle: nil)
            guard let creditViewController = storyBoard.instantiateViewController(withIdentifier: "CreditViewController") as? CreditViewController else { return }
                self.present(creditViewController, animated: true, completion: nil)
        }
    }

    func getData() {
        self.viewModel?.getData()
        self.setUp()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.getNumberOfProducts() ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return constants.kNumberOfItemsInRow
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView
        header?.configure(title: viewModel?.getTshirtName(index: section), subTitle: CommonStrings.description)
        return header
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionIndex = indexPath.section
        return createImageCell(sectionIndex: sectionIndex) ?? UITableViewCell()
    }

    func createImageCell(sectionIndex: Int) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as? ImageViewCell
        cell?.contentView.layer.cornerRadius = 0
        cell?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        guard let imageUrl = viewModel?.getTshirtImageURL(index: sectionIndex) else { return UITableViewCell() }
        cell?.configure(imageURL: imageUrl, price: viewModel?.getTshirtPrice(index: sectionIndex))
        return cell
    }

    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(constants.rowHeight)
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            let headerView = view as? UITableViewHeaderFooterView
        headerView?.contentView.layer.cornerRadius = CGFloat(constants.cornerRadius)
        headerView?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

//MARK: Delegate
extension HomeTableViewController {
    func navigateToErrorScreen() {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "GenericScreenWithImage", bundle: nil)
            guard let errorViewController = storyBoard.instantiateViewController(withIdentifier: "GenericScreenWithImage") as? GenericScreenWithImageViewController else { return }
                self.present(errorViewController, animated: true, completion: nil)
            errorViewController.configure(imageName: "ErrorImage", description: CommonStrings.errorDescription)
        }
    }

    func showLoadingScreen() {
        DispatchQueue.main.async {
            let storyBoard = UIStoryboard(name: "GenericScreenWithImage", bundle: nil)
            guard let loadingViewController = storyBoard.instantiateViewController(withIdentifier: "GenericScreenWithImage") as? GenericScreenWithImageViewController else { return }
                self.present(loadingViewController, animated: true, completion: nil)
            loadingViewController.configure(imageName: "LoadingImage", description: CommonStrings.loading)
        }
    }

    func dismissLoadingScreen() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }

    func reloadTable() {
        self.tableView.reloadData()
    }
}

