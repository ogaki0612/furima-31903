class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :status

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :details
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999_999 }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :status_id
  end
end
