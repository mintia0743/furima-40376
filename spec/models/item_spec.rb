require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '正常系のテスト' do
    it '有効な属性値の場合、有効であること' do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end
  end

  describe '異常系のテスト' do
    context '必須項目が欠けている場合' do
      it 'nameがないと無効であること' do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it 'descriptionがないと無効であること' do
        item = FactoryBot.build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
      end

      it 'imageがないと無効であること' do
        item = FactoryBot.build(:item, image: nil)
        item.valid?
        expect(item.errors[:image]).to include("can't be blank")
      end

      it 'categoryがないと無効であること' do
        item = FactoryBot.build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("can't be blank")
      end

      it 'statusがないと無効であること' do
        item = FactoryBot.build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include("can't be blank")
      end

      it 'shipping_feeがないと無効であること' do
        item = FactoryBot.build(:item, shipping_fee: nil)
        item.valid?
        expect(item.errors[:shipping_fee]).to include("can't be blank")
      end

      it 'prefectureがないと無効であること' do
        item = FactoryBot.build(:item, prefecture: nil)
        item.valid?
        expect(item.errors[:prefecture]).to include("can't be blank")
      end

      it 'scheduled_deliveryがないと無効であること' do
        item = FactoryBot.build(:item, scheduled_delivery: nil)
        item.valid?
        expect(item.errors[:scheduled_delivery]).to include("can't be blank")
      end

      it 'priceがないと無効であること' do
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it 'priceが300未満の場合、無効であること' do
        item = FactoryBot.build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it 'priceが99999999を超える場合、無効であること' do
        item = FactoryBot.build(:item, price: 10_000_000)
        item.valid?
        expect(item.errors[:price]).to include("must be less than or equal to 99999999")
      end

      it 'priceが半角数字でない場合、無効であること' do
        item = FactoryBot.build(:item, price: "abc")
        item.valid?
        expect(item.errors[:price]).to include("は半角数値のみ入力できます")
      end
    end
  end
end
