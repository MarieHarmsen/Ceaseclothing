import Foundation

final class ProductCatalogueViewData: NSObject, ProductsCatalogueViewData {
    var products: [Product]? {
        return productCatalogueResponse.products
    }
    var title: String? {
        return productCatalogueResponse.title
    }
    var numberOfProducts: Int? {
        return productCatalogueResponse.numberOfProducts
    }

    subscript(index: Int) -> Product? {
        return products?[index]
    }

    private let productCatalogueResponse: ProductCatalouge
    init?(productCatalogueResponse: ProductCatalouge?) {
        guard let productCatalogueResponse = productCatalogueResponse else { return nil }
        self.productCatalogueResponse = productCatalogueResponse
    }
}
