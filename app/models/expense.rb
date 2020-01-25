class Expense < ApplicationRecord
    belongs_to :user
    validates :memo, presence: true, length: { maximum: 255 }
    validates :date, presence: true
    validates :price, presence: true, length: { maximum: 20 },
                numericality: true
    
end
