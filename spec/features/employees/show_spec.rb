require 'rails_helper'

RSpec.describe 'employee show page' do
  before(:each) do
    @dept1 = Department.create!(name: 'Engineering', floor: '10')
    @emp1 = @dept1.employees.create!(name: 'John Smith', level: 3)
    @emp2 = @dept1.employees.create!(name: 'John Doe', level: 32)
    @ticket1 = @emp1.tickets.create!(subject: 'broken faucet', age: 2)
    @ticket2 = @emp1.tickets.create!(subject: 'torn carpet', age: 9)
    @ticket3 = @emp1.tickets.create!(subject: 'bug infestation', age: 6)
    @ticket4 = @emp2.tickets.create!(subject: 'leaky pipe', age: 4)
  end

  it 'lists employees name and department' do
    visit "/employees/#{@emp1.id}"

    expect(page).to have_content(@emp1.name)
    expect(page).to have_content(@emp1.department.name)
  end

  it 'lists all tickets in order of age' do
    visit "/employees/#{@emp1.id}"

    within("div#tickets")do
      expect(@ticket2.subject).to appear_before(@ticket3.subject)
      expect(@ticket3.subject).to appear_before(@ticket1.subject)
    end
  end

  it 'separate from list of tickets displays the oldest ticket' do
    visit "/employees/#{@emp1.id}"

    within("div#oldest_ticket")do
      expect(page).to have_content(@ticket2.subject)
      expect(page).to have_content(@ticket2.age)
    end
  end

  it 'does not show tickets that are not assigned to the employee' do
    visit "/employees/#{@emp1.id}"

    expect(page).to_not have_content(@ticket4.subject)
  end

  it 'has a form to add a ticket to the department' do
    visit "/employees/#{@emp1.id}"

    expect(page).to_not have_content(@ticket4.subject)

    fill_in('ticket_id', with: @ticket4.id)
    click_button('Submit')

    expect(current_path).to eq("/employees/#{@emp1.id}")
    expect(page).to have_content(@ticket4.subject)
  end
end
