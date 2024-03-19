require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'validations' do
    context '異常系のテスト' do
      it 'validates presence of nickname' do
        @user.nickname = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it 'validates presence of email' do
        @user.email = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'validates uniqueness of email' do
        FactoryBot.create(:user, email: "test@example.com")
        @user.email = "test@example.com"
        expect(@user).not_to be_valid
        expect(@user.errors[:email]).to include("has already been taken")
      end

      it 'validates presence of last_name' do
        @user.last_name = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it 'validates presence of first_name' do
        @user.first_name = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it 'validates presence of last_name_kana' do
        @user.last_name_kana = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end

      it 'validates presence of first_name_kana' do
        @user.first_name_kana = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end

      it 'validates presence of birth_date' do
        @user.birth_date = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:birth_date]).to include("can't be blank")
      end

      it 'validates length of password' do
      @user.password = "12345"
      expect(@user).not_to be_valid
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end


    context '正常系のテスト' do
      it 'validates format of last_name_kana' do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it 'validates format of first_name_kana' do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end

      it 'validates format of password' do
        @user.password = "password123"
        expect(@user).to be_valid
      end
    end
  end
end