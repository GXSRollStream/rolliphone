class PeopleController < BaseResourceController
  def init
    if super
      @resource_klass = Contact
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Contacts', image:"contact.png".uiimage, tag:1)
      self.title = "Contacts"
    end

    self
  end

  def load_controller(resource)
    PersonController.alloc.initWithContact(resource) 
  end
end
