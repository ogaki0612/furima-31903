require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム新規登録' do
    it '正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'detailsが空だと出品できない' do
      @item.details = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Details can't be blank")
    end
    it 'categoriy_idが0だと出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end
    it 'staus_idが0だと出品できない' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 0')
    end
    it 'postage_idが0だと出品できない' do
      @item.postage_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage must be other than 0')
    end
    it 'prefecture_idが0だと出品できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'shipping_date_idが0だと出品できない' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 0')
    end
    it 'priceが空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceの値が300より小さいと出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceの値が999999999より大きいと出品できない' do
      @item.price = '1000000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 999999999')
    end
    it 'priceの値が全角数字だと出品できない' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceの値が半角数字意外だと出品できない' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
