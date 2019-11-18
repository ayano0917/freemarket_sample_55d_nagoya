class CreditCard < ApplicationRecord
  include ActiveModel::Model
  belongs_to :user

end