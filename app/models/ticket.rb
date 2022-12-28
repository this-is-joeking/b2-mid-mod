class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets

  def self.oldest_to_youngest
    order(age: :desc)
  end
end