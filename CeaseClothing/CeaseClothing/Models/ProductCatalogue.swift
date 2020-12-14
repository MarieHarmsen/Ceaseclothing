class ProductCatalouge: Codable {
    let products : [Product]?
    let title: String?
    let numberOfProducts: Int?

    enum CodingKeys: String, CodingKey {
        case products
        case title
        case numberOfProducts = "product_count"
    }

    public init(products: [Product]?, title: String?, numberOfProducts: Int?) {
        self.products = products
        self.title = title
        self.numberOfProducts = numberOfProducts
    }
}
