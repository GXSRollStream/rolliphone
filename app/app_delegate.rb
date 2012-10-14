class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init

    people        = UINavigationController.alloc.initWithRootViewController(PeopleController.alloc.init)
    organizations = UINavigationController.alloc.initWithRootViewController(OrganizationsController.alloc.init)

    tabbar.viewControllers = [people, organizations]
    tabbar.selectedIndex = 0
    @window.rootViewController = tabbar
    @window.makeKeyAndVisible
    true
  end
end
