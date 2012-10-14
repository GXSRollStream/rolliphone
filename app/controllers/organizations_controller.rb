class OrganizationsController < BaseResourceController
  def viewDidLoad
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Companies', image:nil, tag:2)
  end

  def init
    if super
      @resource_klass = Organization 
    end

    self
  end

  def load_controller(resource)
    OrganizationController.alloc.initWithOrganization(resource) 
  end
end
