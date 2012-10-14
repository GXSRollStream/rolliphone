class PeopleController < BaseResourceController
  def init
    if super
      @resource_klass = Contact
    end

    self
  end

  def viewDidLoad
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Contacts', image:nil, tag:1)
  end

  def load_controller(resource)
    PersonController.alloc.initWithContact(resource) 
  end
end
