class Intervention < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :building
  belongs_to :battery
  belongs_to :column, optional: true
  belongs_to :elevator, optional: true
  belongs_to :employee, optional: true
end
