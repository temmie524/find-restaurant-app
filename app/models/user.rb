class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # addressを基準に緯度経度を算出
  geocoded_by :address
  #住所変更時に緯度経度も変更
  after_validation :geocode,if: :address_changed?
  
end
