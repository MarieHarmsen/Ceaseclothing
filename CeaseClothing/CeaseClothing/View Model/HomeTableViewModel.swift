import Foundation

class HomeTableViewModel {
    private weak var viewModelDelegate: HomeViewModelDelegate?
    private var productCatalogueViewData : ProductCatalogueViewData?

    init(with viewModelDelegate: HomeViewModelDelegate?) {
        self.viewModelDelegate = viewModelDelegate
    }

    func getData() {
        self.viewModelDelegate?.showLoadingScreen()
        guard let url = URL(string: "https://www.endclothing.com/media/catalog/example.json") else {
            showErrorScreen()
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if error != nil {
                self?.showErrorScreen()
                return
            }
            if let data = data {
                guard let product = try? JSONDecoder().decode(ProductCatalouge.self, from: data) else {
                    self?.showErrorScreen()
                    return
                }
                self?.productCatalogueViewData = ProductCatalogueViewData(productCatalogueResponse: product)
                DispatchQueue.main.async {
                    self?.viewModelDelegate?.dismissLoadingScreen()
                    self?.viewModelDelegate?.reloadTable()
                }
            }
        }.resume()
    }

    func showErrorScreen() {
        viewModelDelegate?.dismissLoadingScreen()
        do {
            sleep(5)
        }
        viewModelDelegate?.navigateToErrorScreen()
    }

    func getTshirtName(index: Int) -> String {
        return productCatalogueViewData?.products?[index].name ?? ""
    }

    func getTshirtPrice(index: Int) -> String {
        return productCatalogueViewData?.products?[index].price ?? ""
    }

    func getTshirtImageURL(index: Int) -> URL? {
        return URL(string: productCatalogueViewData?.products?[index].imageURLString ?? "")
    }

    func getNumberOfProducts() -> Int {
        return productCatalogueViewData?.numberOfProducts ?? 0
    }
}
