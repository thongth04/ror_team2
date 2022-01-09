class Reportlists < ApplicationRecord
    scope :having_created_at_between, ->(beginning_of_day,end_of_day) { where(created_at: beginning_of_day..end_of_day) }
    def end_of_day
        change(hour: 23, min: 59, sec: 59, usec: Rational(999999999, 1000))
    end
end
