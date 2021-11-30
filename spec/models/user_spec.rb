require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'ensures first name presence' do
      user = User.new(lastName: 'last', password:'123', email:'dc@gmail').save
      expect(user).to eq(false)
    end
  end

  context 'scope test' do
    before(:each) do
      @user = User.new(name: 'first', lastName: 'last', password:'123456', email:'dc@gmail').save
      @user = User.new(name: 'first', lastName: 'last', password:'123456', email:'dc@gmail').save
      @user = User.new(name: 'first', lastName: 'last', password:'123456', email:'dc@gmail', active:false).save
      @user = User.new(name: 'first', lastName: 'last', password:'123456', email:'dc@gmail', active:false).save
    end

    it 'should getActive users' do
      expect(User.getActive.count).to eq(2)
    end
  end

end
