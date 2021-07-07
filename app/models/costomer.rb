class Costomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  #boolean型の場合はenumではなくviewにif文で書く
  #enum is_active: { "有効":true, "退会":false}
  
end
