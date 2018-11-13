require 'rails_helper'

RSpec.describe Product, type: :model do
category = Category.create!(name: "Lmao")
product = category.products.create!(name: "Electric Chair", price: 987.65, quantity: 2)
subject {product}
  
  describe 'Validations' do
    # validation tests/examples here
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:price) }
    # it { is_expected.to validate_presence_of(:quantity)}
   	# it { is_expected.to validate_presence_of(:category)}
   	it 'has been instantiated' do
   		expect(subject).to be_an(Product)
   	end

	  it 'is valid with valid attributes' do
	  	
	  	expect(subject).to be_valid   
	  end
	  it 'is not valid without a name' do
	  	subject.name = nil
	  	expect(subject).to_not be_valid   
	  end
	  it "is not valid without a price" do
    	subject.price = nil
    	expect(subject).to_not be_valid
  	  end

	  it "is not valid without a quantity" do
	   	subject.quantity = nil
	    expect(subject).to_not be_valid
	  end

	  it "is not valid without a category" do
	   	subject.category = nil
	    expect(subject).to_not be_valid
	  end
  end
end
