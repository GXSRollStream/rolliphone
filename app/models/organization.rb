class Organization
  ATTRIBUTES = [ 
                :company_id, 
                :name, 
                :number_of_employees,
                :created_at,
                :updated_at,
                :address_city, 
                :address_state, 
                :address_zip, 
                :address_country, 
                :address_line1, 
                :address_line2, 
                :address_line3,
                :fax,
                :phone 
              ]

  attr_reader *ATTRIBUTES


  def initialize(attrs)
    attrs.each_pair do | key, value |
      instance_variable_set("@#{key}", value)
    end
  end

  def self.load
    ResourceAPI.get('organizations.json').map { |r| Organization.new(r) }
  end

  def construct_cell(cell)
    cell.textLabel.text = name
    cell.detailTextLabel.text = company_id
  end

  def second_line
    "#{address_line2}, #{address_city}"
  end

  def third_line
    "#{address_state}, #{address_country}, #{address_zip}"
  end
end
