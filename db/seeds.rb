 User.create(
  id: 1,
  email: 'aaa@aaa',
  password: '000000',
  nickname: 'あああ',
  last_name: '山田',
  first_name: '優子',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'ユウコ',
  birth_year_id: 1,
  birth_month: 10,
  birth_day: 19,
  phone: '09011111111',
 )

 ShippingAddress.create(
   id: 1,
   shipping_last_name: '鈴木',
   shipping_first_name: '太郎',
   shipping_last_name_kana: 'スズキ',
   shipping_first_name_kana: 'タロウ',
   postal_code: '123-4567',
   prefecture_id: 1,
   city: '北海道',
   house_number: '札幌1-1',
   user_id: 1
 )

 Item.create(
  id: 1,
  name: 'はなこ',
  description: '帽子',
  condition_id: 1,
  shipping_fee_id: 1,
  shipping_form_id: 1,
  prefecture_id: 1,
  days_before_shipping_id: 1,
  size_id: 1,
  brand: 'a',
  price: 1500,
  seller_id: 1,
  status: '1'
 )