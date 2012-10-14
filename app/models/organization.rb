class Organization
  attr_accessor :name, :company_id

  def initialize(attrs)
    @name = attrs['name']
    @company_id = attrs['company_id']
  end

  def self.load
    ResourceAPI.get('organizations.json').map { |r| Organization.new(r) }
  end

  def construct_cell(cell)
    cell.textLabel.text = name
    cell.detailTextLabel.text = company_id
  end
end
