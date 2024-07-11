import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupBarAppearence()
        return true
    }
    
    private func setupBarAppearence() {
        let barAppearance = UINavigationBarAppearance()
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        //BarButtons ItemColor
        UIBarButtonItem.appearance().tintColor = .white
        
        //Collapsed TitleColor
        barAppearance.titleTextAttributes = textAttributes
        
        //Large TitleColor
        barAppearance.backgroundColor = .black
        barAppearance.largeTitleTextAttributes = textAttributes
        
        if #available(iOS 13, *) {
            UINavigationBar.appearance().standardAppearance = barAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        }
    }

// MARK: UISCENE SESSION LIFE CYCLE

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}

