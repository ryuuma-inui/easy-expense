class Expense < ApplicationRecord
    belongs_to :user
    validates :memo, presence: true, length: { maximum: 255 }
    
    t.date :date
end
