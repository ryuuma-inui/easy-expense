class Expense < ApplicationRecord
    belongs_to :user
    validates :memo, presence: true, length: { maximum: 255 }
    validates :price, presence: true, length: { maximum: 20 },
                numericality: true
    validates :date, presence: true
   
end
