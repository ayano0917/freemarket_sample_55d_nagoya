crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_mypage_path(current_user)
end

crumb :notice do
  link "おしらせ", notice_user_mypage_path
  parent :mypage
end

crumb :todo_list do
  link "やることリスト", todo_list_user_mypage_path
  parent :mypage
end

crumb :like_list do
  link "いいね！一覧", like_list_user_mypage_path
  parent :mypage
end

crumb :items_selling do
  link "出品した商品-出品中", items_selling_user_mypage_path
  parent :mypage
end

crumb :items_during_trading do
  link "出品した商品-取引中", items_during_trading_user_mypage_path
  parent :mypage
end

crumb :items_sold do
  link "出品した商品-売却済み", items_sold_user_mypage_path
  parent :mypage
end

crumb :bought_during_trading do
  link "購入した商品-取引中", bought_during_trading_user_mypage_path
  parent :mypage
end

crumb :bought_past_trade do
  link "購入した商品-過去の取引", bought_past_trade_user_mypage_path
  parent :mypage
end

crumb :plofile do
  link "プロフィール", profile_user_mypage_path
  parent :mypage
end

crumb :change_shipping_address do
  link "発送元・お届け先住所変更", change_shipping_address_user_mypage_path(current_user)
  parent :mypage
end

crumb :credit_card do
  link "支払い方法", payment_user_mypage_path
  parent :mypage
end

crumb :update_email_pass do
  link "メール/パスワード", update_email_pass_user_mypage_path
  parent :mypage
end

crumb :personal_info do
  link "本人情報", personal_info_user_mypage_path
  parent :mypage
end

crumb :confirm_phone do
  link "電話番号の確認", confirm_phone_user_mypage_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_mypage_path
  parent :mypage
end






# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).