class Contact
  ATTRIBUTES = [ 
                :first_name, 
                :last_name, 
                :email,
                :created_at,
                :updated_at,
                :disabled_at,
                :address_city, 
                :address_state, 
                :address_zip, 
                :address_country, 
                :address_line1, 
                :address_line2, 
                :address_line3,
                :fax,
                :mobile_phone,
                :work_phone 
              ]

  attr_reader *ATTRIBUTES

  @@group_name = "GXS-Contacts"

  def initialize(attrs)
    attrs.each_pair do | key, value |
      instance_variable_set("@#{key}", value)
    end

    AddressBook::Person.create(attrs.merge(group_name: @@group_name))
  end

  def self.load
    AddressBook::Person.drop_group(@@group_name)
    ResourceAPI.get('people.json').map { |r| Contact.new(r) }
  end

  def construct_cell(cell)
    cell.textLabel.text = full_name
    cell.detailTextLabel.text = email
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
