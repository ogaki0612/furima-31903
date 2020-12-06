require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nick_nameが空だと登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_cofirmationの値が一致しないと登録できない' do
      @user.password_confirmation = '1234abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birth_dayが空だと登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it 'emailが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが５文字以下だと登録できない' do
      @user.password = '12abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角数字のみの場合登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordは半角英字のみの場合登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが全角では登録できない' do
      @user.password = '１２３ａｂｃ'
      @user.password_confirmation = '１２３ａｂｃ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'first_nameが全角文字でないと登録できない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end
    it 'last_nameが全角文字でないと登録できない' do
      @user.last_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
    end
    it 'first_name_kanaが全角カナでないと登録できない' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
    end
    it 'last_name_kanaが全角カナでないと登録できない' do
      @user.last_name_kana = '鈴木'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
    end
  end
end
