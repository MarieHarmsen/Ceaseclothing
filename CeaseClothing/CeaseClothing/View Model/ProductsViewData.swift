protocol ProductsCatalogueViewData: AnyObject {
    var products: [Product]? { get }
    var title: String? { get }
    var numberOfProducts: Int? { get }

    init?(productCatalogueResponse: ProductCatalouge?)
}
