class OrganizationsController < BaseResourceController
  def init
    if super
      @resource_klass = Organization 
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Companies', image:'company.png'.uiimage, tag:1)
      self.title = "Companies"
    end

    self
  end

  def load_controller(resource)
    OrganizationController.alloc.initWithOrganization(resource) 
  end
end
