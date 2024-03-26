require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'validations' do
    context '異常系のテスト' do
      it 'validates presence of postal_code' do
        order_address = OrderAddress.new(postal_code: nil)
        expect(order_address).not_to be_valid
        expect(order_address.errors[:postal_code]).to include("can't be blank")
      end

      it 'validates format of postal_code' do
        order_address = OrderAddress.new(postal_code: '1234567')
        expect(order_address).not_to be_valid
        expect(order_address.errors[:postal_code]).to include("は3桁ハイフン4桁の半角文字列のみ入力してください")
      end

      it 'validates presence of prefecture_id' do
        order_address = OrderAddress.new(prefecture_id: nil)
        expect(order_address).not_to be_valid
        expect(order_address.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'validates presence of city' do
        order_address = OrderAddress.new(city: nil)
        expect(order_address).not_to be_valid
        expect(order_address.errors[:city]).to include("can't be blank")
      end

      it 'validates presence of block' do
        order_address = OrderAddress.new(block: nil)
        expect(order_address).not_to be_valid
        expect(order_address.errors[:block]).to include("can't be blank")
      end

      it 'validates presence of phone_number' do
        order_address = OrderAddress.new(phone_number: nil)
        expect(order_address).not_to be_valid
        expect(order_address.errors[:phone_number]).to include("can't be blank")
      end

      it 'validates format of phone_number' do
        order_address = OrderAddress.new(phone_number: '123')
        expect(order_address).not_to be_valid
        expect(order_address.errors[:phone_number]).to include("は10桁以上11桁以内の半角数値のみ入力してください")
      end
    end

      end
    end
