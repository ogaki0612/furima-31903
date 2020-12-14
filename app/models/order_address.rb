class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address_1, :address_2, :postal_code, :prefecture_id, :building, :phone_number

  with_options presence: true do
    validates :address_1
    validates :address_2
    validates :postal_code
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(order_id: order.id, address_1: address_1, address_2: address_2, postal_code: postal_code, prefecture_id: prefecture_id, building: building, phone_number: phone_number)
  end
end