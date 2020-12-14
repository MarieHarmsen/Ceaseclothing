class Product: Codable {
    let id : String?
    let name: String?
    let price: String?
    let imageURLString: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case imageURLString = "image"
    }

    public init(id: String?, name: String?, price: String?, imageURLString: String?) {
        self.id = id
        self.name = name
        self.price = price
        self.imageURLString = imageURLString
    }
}
