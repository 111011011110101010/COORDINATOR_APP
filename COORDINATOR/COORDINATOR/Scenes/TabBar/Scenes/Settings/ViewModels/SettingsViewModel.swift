import UIKit

final class SettingsViewModel {
    
    let auth: LogOut?
    
    init(auth: LogOut?) {
        self.auth = auth
    }
    
    private let itemsSettings: [ItemSettingsModel] = [
        ItemSettingsModel(title: "UserInfo", icon: "person", isNavigable: true, navigationNext: .userInfo),
        ItemSettingsModel(title: "Account", icon: "archivebox.circle", isNavigable: true, navigationNext: .account),
        ItemSettingsModel(title: "Theme", icon: "paintbrush", isNavigable: true, navigationNext: .theme),
        ItemSettingsModel(title: "LogOut", icon: "door.right.hand.open", isNavigable: false, navigationNext: .logOut),
        ItemSettingsModel(title: "Version 1.0", icon: "apps.iphone", isNavigable: false, navigationNext: .version),
    ]
    
    var itemsCount: Int {
        itemsSettings.count
    }
    
    func logOut() {
        self.auth?.logOut()
    }
    
    func getItems(row: Int) -> ItemSettingsModel {
        itemsSettings[row]
    }
    
    func cellSelected(row: Int) -> SettingsNavigation {
        let navigation = itemsSettings[row].navigationNext
        
        if navigation == .logOut {
            self.logOut()
        }
        
        return navigation
    }
}
