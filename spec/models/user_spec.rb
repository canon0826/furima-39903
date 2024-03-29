require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザ登録ができる時' do
    it '全ての項目の入力がが存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'パスワードが6文字以上半角英数字であれば登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end
    it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
      @user.last_name = '山田'
      expect(@user).to be_valid
    end
    it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
      @user.first_name = '太郎'
      expect(@user).to be_valid
    end
    it '名字のフリガナが全角（カタカナ）であれば登録できる' do
      @user.last_name_kana = 'ヤマダ'
      expect(@user).to be_valid
    end
    it '名前のフリガナが全角（カタカナ）であれば登録できる' do
      @user.first_name_kana = 'タロウ'
      expect(@user).to be_valid
    end
  end

  context '新規登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません", "パスワードは半角英数字混合で入力してください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは半角英数字混合で入力してください")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードは半角英数字混合で入力してください')
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください", "名字を全角(漢字・カタカナ・ひらがな)で入力してください")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前を全角(漢字・カタカナ・ひらがな)で入力してください")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を全角(漢字・カタカナ・ひらがな)で入力してください')
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を全角(漢字・カタカナ・ひらがな)で入力してください')
    end
    it 'last_name_kanaのフリガナが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）を全角カタカナで入力してください')
    end
    it 'first_name_kanaのフリガナが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）を全角カタカナで入力してください')
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名字（カナ）を入力してください", "名字（カナ）を全角カタカナで入力してください")
    end
    it "first_name_kanaが空だと登録できない" do
    @user.first_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）を全角カタカナで入力してください")
    end
    it "birthdayが空では登録できない" do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'あいうえお１２３'
      @user.password_confirmation = 'あいうえお１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end
  end
end
