require 'rails_helper'

RSpec.describe Ticket do
  describe 'relationships' do
    it { should have_many(:employees).through(:employee_tickets)}
  end

  describe '#oldest_to_youngest' do
    it 'sorts all tickets from oldest to youngest age' do
      @dept1 = Department.create!(name: 'Engineering', floor: '10')
      @emp1 = @dept1.employees.create!(name: 'John Smith', level: 3)
      @emp2 = @dept1.employees.create!(name: 'John Doe', level: 32)
      @ticket1 = @emp1.tickets.create!(subject: 'broken faucet', age: 2)
      @ticket2 = @emp1.tickets.create!(subject: 'torn carpet', age: 9)
      @ticket3 = @emp1.tickets.create!(subject: 'bug infestation', age: 6)

      expect(Ticket.oldest_to_youngest).to eq([@ticket2, @ticket3, @ticket1])

      @ticket4 = @emp1.tickets.create!(subject: 'bug infestation', age: 10)

      expect(Ticket.oldest_to_youngest).to eq([@ticket4, @ticket2, @ticket3, @ticket1])
    end
  end
end