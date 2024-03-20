require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '正常系のテスト' do
    context '有効な属性値の場合' do
      it '有効であること' do
        expect(@item).to be_valid
      end
    end
  end

  describe '異常系のテスト' do
    context '必須項目が欠けている場合' do
      it 'nameがないと無効であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it 'descriptionがないと無効であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it 'imageがないと無効であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'category_idがないと無効であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it 'status_idがないと無効であること' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors[:status_id]).to include("can't be blank")
      end

      it 'shipping_fee_idがないと無効であること' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors[:shipping_fee_id]).to include("can't be blank")
      end

      it 'prefecture_idがないと無効であること' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'scheduled_delivery_idがないと無効であること' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors[:scheduled_delivery_id]).to include("can't be blank")
      end

      it 'priceがないと無効であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it 'priceが300未満の場合、無効であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it 'priceが9999999を超える場合、無効であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it 'priceが半角数字でない場合、無効であること' do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end

      it "userが紐付いていないと保存できない" do
        item = FactoryBot.build(:item)
        item.user = nil
        item.valid?
        expect(item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
