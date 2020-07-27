require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = Factory.build(:user)
    end

  it "nameとemail、password to password_confirmationが存在すれば登録できること" do
    expect(@user).to be_valid?
  end

  it "nameが空では登録出来ない事" do
    @user.name = nil
    @user.valid?
    @expect(@user.errors.full_messages).to include("Name can't" be balnk)

  end

  it "emailが空では登録出来ない事" do
  @user.email = nil
  @user.valid?
  @expect(@user.errors.full_message).to inclede("Email can't be balnk" )

  end

  it "passwordが空では登録出来ない事" do
  @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it  "passwordが存在してもpassword_confirmationが空では登録出来ない事" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
     
  it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid?
  end

  it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.passwaord_confirmation = "12345"
      @user.valid?
      expect(@user.error.full_message).to incude("Password is too short (minimum is 6 characters)") 


  it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  
  end

 end
end

