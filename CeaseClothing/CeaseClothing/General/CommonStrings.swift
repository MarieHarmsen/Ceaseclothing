import Foundation

enum CommonStrings {
    static let appTitle = CommonStrings.tr("Common", "Title.AppName")
    static let errorDescription = CommonStrings.tr("Common", "Error.GenericError")
    static let loading = CommonStrings.tr("Common","Loading")
    static let description = CommonStrings.tr("Common","Item.Description")

    static let creditTitle = CommonStrings.tr("Common","Credits.Title")
    static let credits = CommonStrings.tr("Common","Credits")
    static let creditListOne = CommonStrings.tr("Common","creditListOne")
    static let creditListTwo = CommonStrings.tr("Common","creditListTwo")
    static let creditListThree = CommonStrings.tr("Common","creditListThree")
    static let creditListFour = CommonStrings.tr("Common","creditListFour")
}

extension CommonStrings {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}

