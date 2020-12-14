protocol HomeViewModelDelegate: AnyObject {
    func navigateToErrorScreen()
    func showLoadingScreen()
    func dismissLoadingScreen()
    func reloadTable()
}
