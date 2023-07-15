class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  # lam form Booking dien thong tin passenger - nested form
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
