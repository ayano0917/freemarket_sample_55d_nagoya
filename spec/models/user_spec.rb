require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do

    it "is valid with a nickname, email, password, last_name, first_name, last_name_kana, first_name_kana, birth_year_id, birth_month, birth_day, phone" do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネーム

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームを入力してください")
    end

    it "is invalid a nickname that has more than 21 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("20文字以下で入力してください")
    end

    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    # メールアドレス

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスを入力してください")
    end

    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("そのメールアドレスは既に使われております")
    end

    # パスワード

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("パスワードを入力してください")
    end

    it "is invalid unless 7 to 128 characters" do
      user = build(:user, password: "111")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは7文字以上128文字以下で入力してください")
    end

    it "is invalid 7 to 128 charactersで数字のみ" do
      user = build(:user, password: "1111111")
      user.valid?
      expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを設定してください")
    end

    it "is invalid 7 to 128 charactersで英語のみ" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを設定してください")
    end

    it "is invalid 数字のみ" do
      user = build(:user, password: "1111111111")
      user.valid?
      expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを設定してください")
    end

    it "is invalid 英語のみ" do
      user = build(:user, password: "aaaaaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを設定してください")
    end

    it "is invalid 英語と数字を含むパスワードで7~128文字以外" do
      user = build(:user, password: "111aaa")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは7文字以上128文字以下で入力してください")
    end

    it "is valid 英語と数字を含むパスワードで7~128文字" do
      user = build(:user, password: "11111aaaaa")
      expect(user).to be_valid
    end

    # 姓

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("姓を入力してください")
    end

    it "is invalid a last_name that has more than 36 characters" do
      user = build(:user, last_name: "ああああああああああああああああああああああああああああああああああああああ")
      user.valid?
      expect(user.errors[:last_name]).to include("姓は35文字までです")
    end

    it "is invalid 35文字以下で特殊記号を使っている" do
      user = build(:user, last_name: "ああああああああ1111")
      user.valid?
      expect(user.errors[:last_name]).to include("姓に数字や特殊文字は使用できません")
    end

    it "is valid 35文字以下で特殊記号を使っていない" do
      user = build(:user, last_name: "ああああ")
      expect(user).to be_valid
    end

    # 名

    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("名を入力してください")
    end

    it "is invalid a first_name that has more than 36 characters" do
      user = build(:user, first_name: "ああああああああああああああああああああああああああああああああああああああ")
      user.valid?
      expect(user.errors[:first_name]).to include("名は35文字までです")
    end

    it "is invalid 35文字以下で特殊記号を使っている" do
      user = build(:user, first_name: "ああああああああ1111")
      user.valid?
      expect(user.errors[:first_name]).to include("名に数字や特殊文字は使用できません")
    end

    it "is valid 35文字以下で特殊記号を使っていない" do
      user = build(:user, first_name: "ああああ")
      expect(user).to be_valid
    end


    # 姓カナ

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("姓カナを入力してください")
    end

    it "is invalid a last_name_kana that has more than 36 characters" do
      user = build(:user, last_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("姓カナは35文字までです")
    end

    it "is invalid 35文字以下で特殊記号を使っている" do
      user = build(:user, last_name_kana: "アアアアアアア1111")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("姓カナに数字や特殊文字は使用できません")
    end

    it "is valid 35文字以下で特殊記号を使っていない" do
      user = build(:user, last_name_kana: "アアアア")
      expect(user).to be_valid
    end

    # 名カナ

    it "is invalid without a fitst_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("名カナを入力してください")
    end

    it "is invalid a first_name_kana that has more than 36 characters" do
      user = build(:user, first_name_kana: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("名カナは35文字までです")
    end

    it "is invalid 35文字以下で特殊記号を使っている" do
      user = build(:user, first_name_kana: "アアアアアアア1111")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("名カナに数字や特殊文字は使用できません")
    end

    it "is valid 35文字以下で特殊記号を使っていない" do
      user = build(:user, first_name_kana: "アアアア")
      expect(user).to be_valid
    end


    # 生年月日(年)

    it "is invalid without a birth_year_id" do
      user = build(:user, birth_year_id: "")
      user.valid?
      expect(user.errors[:birth_year_id]).to include("生年月日を正しく入力してください")
    end

    # 生年月日(月)

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("生年月日を正しく入力してください")
    end

    # 生年月日(日)

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("生年月日を正しく入力してください")
    end

    # 携帯番号

    it "is invalid without a phone" do
      user = build(:user, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("会員登録できません")
    end

    it "is invalid with a duplicate phone" do
      user = create(:user)
      another_user = build(:user, phone: user.phone)
      another_user.valid?
      expect(another_user.errors[:phone]).to include("その番号は既に使われております")
    end

    it "is invalid unless 10 to 11 characters " do
      user = build(:user, phone: "111111")
      user.valid?
      expect(user.errors[:phone]).to include("電話番号の書式を確認してください")
    end

    it "is invalid 10 to 11 characters not only figure" do
      user = build(:user, phone: "aaaaaaaaaa1")
      user.valid?
      expect(user.errors[:phone]).to include("電話番号の書式を確認してください")
    end

    it "is valid 10 to 11 characters only figure" do
      user = build(:user, phone: "11111111111")
      expect(user).to be_valid
    end

    # プロフィール

    it "is invalid a profile that has more than 1001 characters" do
      user = build(:user, profile: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:profile]).to include("1000文字以下で入力してください")
    end

    it "is valid with a profile that has less than 1000 characters " do
      user = build(:user, profile: "aaaaaaaaaa")
      expect(user).to be_valid
    end

  end
end