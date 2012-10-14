describe 'A new array' do
  before do
    @contact = ContactAPI.new
  end

  it 'should call contacts api' do
    results = @contact.get('people.json')
    results.should.not.be.nil
  end
end
