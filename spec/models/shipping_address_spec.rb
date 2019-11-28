require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  it 'is valid with shipping_last_name, shipping_first_name, shipping_last_name_kana, shipping_first_name_kana, postal_code, prefecture_id, city, house_number, building, phone, user_id' do
    user = FactoryBot.create(:user)
    shipping_address = ShippingAddress.new(
      shipping_last_name: '山田',
      shipping_first_name: '彩',
      shipping_last_name_kana: 'ヤマダ',
      shipping_first_name_kana: 'アヤ',
      postal_code: '123-4567',
      prefecture_id: '1',
      city: '横浜市緑区',
      house_number: '青山1-1-1',
      building: '',
      phone: '',
      user_id: '',
    )
    expect(shipping_address).to be_valid
  end

end
