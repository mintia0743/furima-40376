require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'validations' do
    context '異常系のテスト' do
      it 'postal_codeが空では保存できない' do
        order_address = OrderAddress.new(postal_code: nil)
        order_address.valid?
        expect(order_address.errors[:postal_code]).to include("can't be blank")
      end

      it 'postal_codeが空では保存できない' do
        order_address = OrderAddress.new(postal_code: '1234567')
        order_address.valid?
        expect(order_address.errors[:postal_code]).to include("は3桁ハイフン4桁の半角文字列のみ入力してください")
      end

      it 'prefecture_idが空では保存できない' do
        order_address = OrderAddress.new(prefecture_id: nil)
        order_address.valid?
        expect(order_address.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'cityが空では保存できない' do
        order_address = OrderAddress.new(city: nil)
        order_address.valid?
        expect(order_address.errors[:city]).to include("can't be blank")
      end

      it 'blockが空では保存できない' do
        order_address = OrderAddress.new(block: nil)
        order_address.valid?
        expect(order_address.errors[:block]).to include("can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        order_address = OrderAddress.new(phone_number: nil)
        order_address.valid?
        expect(order_address.errors[:phone_number]).to include("can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        order_address = OrderAddress.new(phone_number: '123')
        order_address.valid?
        expect(order_address.errors[:phone_number]).to include("は10桁以上11桁以内の半角数値のみ入力してください")
      end
    end
  end
end
