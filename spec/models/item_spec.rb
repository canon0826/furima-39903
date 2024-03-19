require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品登録ができるとき' do
    it '全ての入力事項が、存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
    
  context '出品ができないとき' do
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を選択してください")
    end
    it '商品名が空欄だと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明が空欄だと出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'カテゴリーの情報が空欄だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it '商品の状態の情報が空欄だと出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end
    it '配送料の負担の情報が空欄だと出品できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end
      it '発送元の地域の情報が空欄だと出品できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end
    it '発送までの日数の情報が空だと出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
    it '価格が空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
    end
    it 'priceが半角数字以外では登録できない' do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end
    it '価格の範囲が、300円未満だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
    end
    it '価格の範囲が、9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
    end
    it 'ユーザーが紐付いていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end
    it 'カテゴリが選択されていないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it '商品の条件が選択されていないと出品できない' do
      @item.condition_id = 1 
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end
    it '発送元の地域が選択されていないと出品できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end
    it '発送費の負担が選択されていないと出品できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end
    it '発送までの日数が選択されていないと出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
  end
end
