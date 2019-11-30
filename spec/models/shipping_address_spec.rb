require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '#create' do

    it "is valid with a shipping_last_name, shipping_first_name, shipping_last_name_kana, shipping_first_name_kana, postal_code, prefecture_id, house_number" do
      shipping_address = build(:shipping_address)
      expect(shipping_address).to be_valid
    end

    # 姓(発送先)

    it "is invalid without a shipping_last_name" do
      shipping_address = build(:shipping_address, shipping_last_name: "")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_last_name]).to include("入力してください")
    end

    it "is invalid a shipping_last_name that has more than 36 characters" do
      shipping_address = build(:shipping_address, shipping_last_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_last_name]).to include("35文字以下で入力してください")
    end

    it "is valid with a shipping_last_name that has less than 35 characters " do
      shipping_address = build(:shipping_address, shipping_last_name: "aaaaaaaaaa")
      expect(shipping_address).to be_valid
    end


    # 名(発送先)

    it "is invalid without a shipping_first_name" do
      shipping_address = build(:shipping_address, shipping_first_name: "")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_first_name]).to include("入力してください")
    end

    it "is invalid a shipping_fist_name that has more than 36 characters" do
      shipping_address = build(:shipping_address, shipping_first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_first_name]).to include("35文字以下で入力してください")
    end

    it "is valid with a shipping_first_name that has less than 35 characters " do
      shipping_address = build(:shipping_address, shipping_first_name: "aaaaaaaaaa")
      expect(shipping_address).to be_valid
    end


    # 姓カナ(発送先)

    it "is invalid without a shipping_last_name_kana" do
      shipping_address = build(:shipping_address, shipping_last_name_kana: "")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_last_name_kana]).to include("入力してください")
    end

    it "is invalid a shipping_last_name_kana that has more than 36 characters" do
      shipping_address = build(:shipping_address, shipping_last_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_last_name_kana]).to include("35文字以下で入力してください")
    end

    it "is invalid with a shipping_last_name_kana 35文字以下で全角カタカナ以外" do
      shipping_address = build(:shipping_address, shipping_last_name_kana: "aaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_last_name_kana]).to include("全角カタカナ以外は使用出来ません")
    end

    it "is valid with a shipping_last_name_kana 35文字以下で全角カタカナ" do
      shipping_address = build(:shipping_address, shipping_last_name_kana: "アアア")
      expect(shipping_address).to be_valid
    end

    # 名カナ(発送先)

    it "is invalid without a shipping_first_name_kana" do
      shipping_address = build(:shipping_address, shipping_first_name_kana: "")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_first_name_kana]).to include("入力してください")
    end

    it "is invalid a shipping_fist_name_kana that has more than 36 characters" do
      shipping_address = build(:shipping_address, shipping_first_name_kana: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_first_name_kana]).to include("35文字以下で入力してください")
    end

    it "is invalid with a shipping_first_name_kana 35文字以下で全角カタカナ以外" do
      shipping_address = build(:shipping_address, shipping_first_name_kana: "aaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:shipping_first_name_kana]).to include("全角カタカナ以外は使用出来ません")
    end

    it "is valid with a shipping_last_name_kana 35文字以下で全角カタカナ" do
      shipping_address = build(:shipping_address, shipping_last_name_kana: "アアア")
      expect(shipping_address).to be_valid
    end

    # 郵便番号

    it "is invalid without a postal_code" do
      shipping_address = build(:shipping_address, postal_code: "")
      shipping_address.valid?
      expect(shipping_address.errors[:postal_code]).to include("入力してください")
    end

    it "is invalid with a postal_code 数字以外" do
      shipping_address = build(:shipping_address, postal_code: "aaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:postal_code]).to include("フォーマットが不適切です")
    end

    it "is invalid with a postal_code ハイフン前数字3桁以外・ハイフン後数字4桁以外" do
      shipping_address = build(:shipping_address, postal_code: "00123-456700")
      shipping_address.valid?
      expect(shipping_address.errors[:postal_code]).to include("フォーマットが不適切です")
    end

    it "is valid with a postal_code ハイフン前数字3桁・ハイフン後数字4桁" do
      shipping_address = build(:shipping_address, postal_code: "123-4567")
      expect(shipping_address).to be_valid
    end

    # 県id

    it "is invalid without a prefecture_id" do
      shipping_address = build(:shipping_address, prefecture_id: "")
      shipping_address.valid?
      expect(shipping_address.errors[:prefecture_id]).to include("選択してください")
    end

    # 市町村

    it "is invalid without a city" do
      shipping_address = build(:shipping_address, city: "")
      shipping_address.valid?
      expect(shipping_address.errors[:city]).to include("入力してください")
    end

    it "is invalid a city that has more than 51 characters" do
      shipping_address = build(:shipping_address, city: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:city]).to include("50文字以下で入力してください")
    end

    it "is valid with a city that has less than 50 characters " do
      shipping_address = build(:shipping_address, shipping_first_name: "aaaaaaaaaa")
      expect(shipping_address).to be_valid
    end

    # 番地

    it "is invalid without a house_number" do
      shipping_address = build(:shipping_address, house_number: "")
      shipping_address.valid?
      expect(shipping_address.errors[:house_number]).to include("入力してください")
    end

    it "is invalid a house_number that has more than 101 characters" do
      shipping_address = build(:shipping_address, house_number: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:house_number]).to include("100文字以下で入力してください")
    end

    it "is valid with a city that has less than 50 characters " do
      shipping_address = build(:shipping_address, house_number: "aaaaaaaaaa")
      expect(shipping_address).to be_valid
    end

    # 建物名

    it "is invalid a building that has more than 101 characters" do
      shipping_address = build(:shipping_address, building: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:building]).to include("100文字以下で入力してください")
    end

    it "is valid with a building that has less than 50 characters " do
      shipping_address = build(:shipping_address, building: "aaaaaaaaaa")
      expect(shipping_address).to be_valid
    end

    # 携帯番号

    it "is invalid with a phone 数字以外" do
      shipping_address = build(:shipping_address, phone: "aaaa")
      shipping_address.valid?
      expect(shipping_address.errors[:phone]).to include("電話番号が正しくありません")
    end

    it "is invalid with a phone 数字のみ10・11桁以外" do
      shipping_address = build(:shipping_address, phone: "0000")
      shipping_address.valid?
      expect(shipping_address.errors[:phone]).to include("電話番号が正しくありません")
    end

    it "is valid with a phone 数字のみ10・11桁" do
      shipping_address = build(:shipping_address, phone: "0801234567")
      expect(shipping_address).to be_valid
    end

  end
end
