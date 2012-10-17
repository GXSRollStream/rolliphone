class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init

    tabbar.viewControllers = [
      UINavigationController.alloc.initWithRootViewController(PeopleController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(OrganizationsController.alloc.init)
    ]


    tabbar.selectedIndex = 0

    @window.rootViewController = tabbar
    @window.makeKeyAndVisible
    true
  end
end
