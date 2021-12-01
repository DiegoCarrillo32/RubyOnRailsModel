require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    birthDate = Date.new(1990, 1, 1)
    it 'ensures first name presence' do

      user = User.new(lastName: 'last', password:'123456', email:'dcgreenforest@gmail.com', birthDate:birthDate).save

      expect(user).to eq(false)
    end

    it 'ensures password length' do

      user = User.new(name: 'diego', lastName: 'last', password:'123', email:'dcgreenforest@gmail.com', birthDate:birthDate).save

      expect(user).to eq(false)
    end

    it 'ensures email regex' do

      user = User.new(name:"diego", lastName: 'last', password:'123456', email:'dc@gmail', birthDate:birthDate).save

      expect(user).to eq(false)
    end




  end



  context 'scope test' do
    birthDate = Date.new(1990, 1, 1)
    let (:params) { { name: 'first', lastName: 'last', password: '123456', email: 'dcgreenforest@gmail.com', birthDate: birthDate, active: true } }
    before(:each) do



      User.new(params).save!
      User.new(params.merge(active: true, email: 'dcgreenforest1@gmail.com' )).save!
      User.new(params.merge(active: false, email: 'dcgreenforest2@gmail.com' )).save!
      User.new(params.merge(active: false, email: 'dcgreenforest3@gmail.com' )).save!
    end

    it 'should return active users' do

      expect(User.active_users.size).to eq(2)

    end
  end

end
