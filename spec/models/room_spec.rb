require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
       expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
       @user.name = nill
       @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
       
    end

    it "emailが空では登録できないこと" do
      @user.email = nill
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    
    end

    it "passwordが空では登録できないこと" do
      @user.password = nill
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")

    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end

