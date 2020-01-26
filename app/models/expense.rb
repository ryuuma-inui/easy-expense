class Expense < ApplicationRecord
    belongs_to :user
    validates :memo, presence: true, length: { maximum: 255 }
    validates :date, presence: true
    validates :price, presence: true, length: { maximum: 20 },
                numericality: true
    
    # 日付のバリデーション参考
    # https://railsguides.jp/active_record_validations.html#%E3%82%AB%E3%82%B9%E3%82%BF%E3%83%A0%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89
end
