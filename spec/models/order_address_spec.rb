require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'validations' do
    context '異常系のテスト' do
      before do
        @order_address = FactoryBot.build(:order_address)
        @order_address.token = "valid_token" # 有効なトークンを設定する
      end

      it 'validates presence of postal_code' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors[:postal_code]).to include("can't be blank")
      end

      it 'validates format of postal_code' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors[:postal_code]).to include("は3桁ハイフン4桁の半角文字列のみ入力してください")
      end

      it 'validates presence of prefecture_id' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'validates presence of prefecture_id' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'validates presence of city' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors[:city]).to include("can't be blank")
      end

      it 'validates presence of block' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors[:block]).to include("can't be blank")
      end

      it 'validates presence of phone_number' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("can't be blank")
      end

      it 'validates format of phone_number' do
        @order_address.phone_number = '123'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("は10桁以上11桁以内の半角数値のみ入力してください")
      end

      it 'validates format of phone_number' do
        # 電話番号が9桁以下の場合
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("は10桁以上11桁以内の半角数値のみ入力してください")
      
        # 電話番号が12桁以上の場合
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("は10桁以上11桁以内の半角数値のみ入力してください")
      
        # 電話番号に半角数字以外が含まれている場合
        @order_address.phone_number = '090-1111-1111'
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("は10桁以上11桁以内の半角数値のみ入力してください")
      end
      

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  
    context '正常系のテスト' do
      it 'tokenが存在する場合、有効であること' do
        expect(@order_address).to be_valid
      end
    
      it '建物名が空でも購入できること' do
        @order_address.building = ''  
        @order_address.valid?
        expect(@order_address.errors[:building]).not_to include("can't be blank")
      end
    end
  end
end

