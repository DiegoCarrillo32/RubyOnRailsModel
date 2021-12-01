require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it 'should have a price greater than 0' do
      prod = Product.new(name:"zanahoria", price: 0, code: "12345", quantity: 1).save
      expect(prod).to eq(false)
    end
    it 'should have a quantity greater than 0' do
      prod = Product.new(name:"zanahoria", price: 1, code: "12345", quantity: 0).save
      expect(prod).to eq(false)

    end


  end
end
