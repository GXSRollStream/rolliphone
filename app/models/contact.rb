class Contact
  attr_accessor :first_name, :last_name
  def initialize(attrs)
    @first_name = attrs['first_name']
    @last_name = attrs['last_name']
  end

  def self.load
    ResourceAPI.get('people.json').map { |r| Contact.new(r) }
  end

  def construct_cell(cell)
    cell.textLabel.text = last_name
    cell.detailTextLabel.text = first_name
  end
end
