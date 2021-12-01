require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  context 'validations' do

    it 'should have a valid quantity' do
      birthDate = Date.new(1990, 1, 1)
      user = User.new(name:"diego", lastName: 'last', password:'123456', email:'dcgreenforest@gmail.com', birthDate:birthDate).save
      Order.new(date: Time.now, active: true, user: User.all[0]).save
      Product.new(name: 'product', price: 10, code: '123', quantity: 10, active: true).save
      orderItem = OrderItem.new(quantity: 0, order: Order.all[0], product: Product.all[0]).save
      expect(orderItem).to eq(false)
    end

    it 'should not have repeated products' do
      birthDate = Date.new(1990, 1, 1)
      user = User.new(name:"diego", lastName: 'last', password:'123456', email:'dcgreenforest@gmail.com', birthDate:birthDate).save
      Order.new(date: Time.now, active: true, user: User.all[0]).save
      Product.new(name: 'product', price: 10, code: '123', quantity: 10, active: true).save
      orderItem = OrderItem.new(quantity: 1, order: Order.all[0], product: Product.all[0]).save
      secondItem = OrderItem.new(quantity: 1, order: Order.all[0], product: Product.all[0]).save
      expect(secondItem).to eq(false)
    end

    it 'should not have inactive items' do
      birthDate = Date.new(1990, 1, 1)
      user = User.new(name:"diego", lastName: 'last', password:'123456', email:'dcgreenforest@gmail.com', birthDate:birthDate).save
      Order.new(date: Time.now, active: true, user: User.all[0]).save
      Product.new(name: 'product', price: 10, code: '123', quantity: 10, active: false).save!
      orderItem = OrderItem.new(quantity: 1, order: Order.all[0], product: Product.all[0]).save
      expect(orderItem).to eq(false)
    end

    end

  end

