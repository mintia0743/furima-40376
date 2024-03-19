require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of nickname' do
      user = User.new(nickname: nil)
      expect(user).not_to be_valid
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    it 'validates presence of email' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it 'validates uniqueness of email' do
      existing_user = FactoryBot.create(:user)
      new_user = FactoryBot.build(:user, email: existing_user.email)
      new_user.valid?
      expect(new_user.errors[:email]).to include("has already been taken")
    end
    
    it 'validates presence of encrypted_password' do
      user = User.new(encrypted_password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end
    
    it 'validates presence of last_name' do
      user = User.new(last_name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    
    it 'validates presence of first_name' do
      user = User.new(first_name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    
    it 'validates presence of last_name_kana' do
      user = User.new(last_name_kana: nil)
      expect(user).not_to be_valid
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    
    it 'validates presence of first_name_kana' do
      user = User.new(first_name_kana: nil)
      expect(user).not_to be_valid
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    
    it 'validates format of last_name_kana' do
      user = FactoryBot.build(:user, last_name_kana: "ヤマダ")
      user.valid?
      expect(user).to be_valid
    end
    
    it 'validates format of first_name_kana' do
      user = FactoryBot.build(:user, first_name_kana: "タロウ")
      user.valid?
      expect(user).to be_valid
    end
    
    it 'validates presence of birth_date' do
      user = User.new(birth_date: nil)
      expect(user).not_to be_valid
      expect(user.errors[:birth_date]).to include("can't be blank")
    end
    
    it 'validates format of password' do
      user = FactoryBot.build(:user, password: "password123")
      user.valid?
      expect(user).to be_valid
    end
  end
end