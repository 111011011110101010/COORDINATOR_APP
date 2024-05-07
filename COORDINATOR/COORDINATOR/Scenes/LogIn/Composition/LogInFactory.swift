import UIKit

struct LogInFactory {
    
    var appDIContainer: AppDIContainer?
    
    func makeLoginScene(delegate: LogInSceneDelegate) -> UIViewController {
        let viewModel = LoginViewModel(auth: appDIContainer?.auth)
        return LogInScene(viewModel: viewModel, delegate: delegate)
    }
}
