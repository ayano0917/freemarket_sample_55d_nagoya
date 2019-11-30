FactoryBot.define do
  factory :shipping_address do
    shipping_last_name              {"山田"}
    shipping_first_name             {"彩"}
    shipping_last_name_kana         {"ヤマダ"}
    shipping_first_name_kana        {"アヤ"}
    postal_code                     {"123-4567"}
    prefecture_id                   {"1"}
    city                            {"適当"}
    house_number                    {"適当"}
  end
end