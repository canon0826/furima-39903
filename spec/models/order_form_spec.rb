require 'rails_helper'

RSpec.describe OrderForm, type: :model do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form,user_id: @user.id, item_id: @item.id)
    end

  describe '商品購入記録の保存' do

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid
    end
    it '建物名は空でも保存できること' do
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空だと保存できないこと' do
      @order_form.postal_code = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号は3桁ハイフン4桁の正しい形式でないと保存できないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県を選択していないと保存できないこと' do
      @order_form.shipping_area_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Shipping area can't be blank")
    end
    it '市区町村が空だと購入できないこと' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_form.address = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_form.phone_number = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が9桁以下だと購入できないこと' do
      @order_form.phone_number = '090123456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Do not Include hyphen(-)")
    end
    it '電話番号が12桁以上だと購入できない' do
      @order_form.phone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Do not Include hyphen(-)")
    end
    it '電話番号が半角数値でないと購入できないこと' do
      @order_form.phone_number = '123-456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Do not Include hyphen(-)")
    end
    it 'user_idが紐づいていなければ購入できないこと' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが紐づいていなければ購入できないこと' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
end