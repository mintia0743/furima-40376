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

      it 'validates presence of password' do
        @user.password = nil
        expect(@user).not_to be_valid
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'validates length of password' do
        @user.password = "12345"
        expect(@user).not_to be_valid
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it 'validates password with only alphabets' do
        @user.password = "abcdef"
        expect(@user).not_to be_valid
        expect(@user.errors[:password]).to include("は半角英数字混合で入力してください")
      end

      it 'validates password with full-width characters' do
        @user.password = "パスワード"
        expect(@user).not_to be_valid
        expect(@user.errors[:password]).to include("は半角英数字混合で入力してください")
      end

      it 'validates password confirmation' do
        @user.password_confirmation = "different_password"
        expect(@user).not_to be_valid
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'validates presence of last_name containing half-width characters' do
        @user.last_name = "Smith"
        expect(@user).not_to be_valid
        expect(@user.errors[:last_name]).to include("はひらがな、カタカナ、漢字のみ使用できます")
      end

      it 'validates presence of first_name containing half-width characters' do
        @user.first_name = "John"
        expect(@user).not_to be_valid
        expect(@user.errors[:first_name]).to include("はひらがな、カタカナ、漢字のみ使用できます")
      end

      it 'validates presence of last_name_kana containing non-katakana characters' do
        @user.last_name_kana = "やまだ"
        expect(@user).not_to be_valid
        expect(@user.errors[:last_name_kana]).to include("は全角カタカナで入力してください")
      end

      it 'validates presence of first_name_kana containing non-katakana characters' do
        @user.first_name_kana = "たろう"
        expect(@user).not_to be_valid
        expect(@user.errors[:first_name_kana]).to include("は全角カタカナで入力してください")
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