import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		//UIApplication.shared.statusBarStyle = .lightContent
		let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
		if launchedBefore  {
			self.window = UIWindow(frame: UIScreen.main.bounds)
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let initialViewController = storyboard.instantiateViewController(withIdentifier: "TabView")
			self.window?.rootViewController = initialViewController
			self.window?.makeKeyAndVisible()
		}
		return true
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
		
		var tabBarViewController: UITabBarController
		var optTabBarViewController: UITabBarController?
		if let let_tabBarViewController = self.window!.rootViewController as? UITabBarController {
			optTabBarViewController = let_tabBarViewController
		}
		if let let_introPageViewController = self.window!.rootViewController as? IntroPageViewController {
			optTabBarViewController = let_introPageViewController.children[0] as? UITabBarController
		}
		if(optTabBarViewController == nil) {
			return false
		} else {
			tabBarViewController = optTabBarViewController!
		}
		
		print(tabBarViewController.viewControllers?.count ?? 0)
		var splitViewController:UISplitViewController?
		for viewController in tabBarViewController.viewControllers! {
			if viewController.title == "SplitView" {
				splitViewController = viewController as? UISplitViewController
			}
		}
		
		let navigationController = splitViewController!.viewControllers[splitViewController!.viewControllers.count-1] as! UINavigationController
		navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem
		//splitViewController!.delegate = self
		
		if let splitViewController = splitViewController {//window?.rootViewController as? UISplitViewController {
			let primaryViewController = splitViewController.primaryViewController as! UINavigationController
			let listViewController = primaryViewController.viewControllers[0] as! PlanetListViewController
			listViewController.restoreUserActivityState(userActivity)
		} else { //it is the first time we launched
			let introPageViewController = window?.rootViewController as? IntroPageViewController
			let splitViewController = introPageViewController?.children[0] as? UISplitViewController
			let primaryViewController = splitViewController?.primaryViewController as? UINavigationController
			let listViewController = primaryViewController?.viewControllers[0] as! PlanetListViewController
			listViewController.restoreUserActivityState(userActivity)
		}
		
		return true
	}
}
