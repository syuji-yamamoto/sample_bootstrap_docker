class Product < ApplicationRecord
	validates :name, presence: true
	validates :name_kana, presence: true
	validates :price, presence: true
end
