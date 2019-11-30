require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  describe '#create' do

    it "is valid with a postal_code, city, house_number, building" do
      user_address = build(:user_address)
      expect(user_address).to be_valid
    end

    # 郵便番号

    it "is invalid 数字以外で7文字以外" do
      user_address = build(:user_address, postal_code: "あああああ")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("フォーマットが不適切です")
    end

    it "is invalid 数字以外で7文字" do
      user_address = build(:user_address, postal_code: "あああああああ")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("フォーマットが不適切です")
    end

    it "is invalid 7文字以外で数字のみ" do
      user_address = build(:user_address, postal_code: "1111")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("ハイフン抜き半角数字7文字で入力してください")
    end

    it "is valid 7文字で数字のみ" do
      user_address = build(:user_address, postal_code: "1111111")
      expect(user_address).to be_valid
    end

    # 市町村

    it "is invalid a city that has more than 51 characters" do
      user_address = build(:user_address, city: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user_address.valid?
      expect(user_address.errors[:city]).to include("50文字以下で入力してください")
    end

    it "is valid with a city that has less than 50 characters" do
      user_address = build(:user_address, city: "aaaaaaaaaa")
      expect(user_address).to be_valid
    end

    # 番地

    it "is invalid a house_number that has more than 101 characters" do
      user_address = build(:user_address, house_number: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user_address.valid?
      expect(user_address.errors[:house_number]).to include("100文字以下で入力してください")
    end

    it "is valid with a house_number that has less than 100 characters" do
      user_address = build(:user_address, house_number: "aaaaaaaaaa")
      expect(user_address).to be_valid
    end

    # 建物名

    it "is invalid a building that has more than 101 characters" do
      user_address = build(:user_address, building: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user_address.valid?
      expect(user_address.errors[:building]).to include("100文字以下で入力してください")
    end

    it "is valid with a building that has less than 100 characters" do
      user_address = build(:user_address, house_number: "aaaaaaaaaa")
      expect(user_address).to be_valid
    end

  end
end
