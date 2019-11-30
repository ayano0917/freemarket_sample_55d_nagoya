FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"1111111a"}
    last_name             {"山田"}
    first_name            {"彩"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"アヤ"}
    birth_year_id         {"1"}
    birth_month           {"12"}
    birth_day             {"2"}
    phone                 {"08012345678"}
  end
end