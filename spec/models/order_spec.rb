require 'rails_helper'

RSpec.describe Order, User, type: :model do
  context  'validations' do
    it 'should have only one active order' do
      birthDate = Date.new(1990, 1, 1)
      user = User.new(name:"diego", lastName: 'last', password:'123456', email:'dcgreenforest@gmail.com', birthDate:birthDate).save
      Order.new(date: Time.now, active: true, user: User.all[0]).save
      secondOrder = Order.new(date: Time.now, active: true, user: User.all[0]).save



      expect(secondOrder).to eq(false)
    end

  end
end
