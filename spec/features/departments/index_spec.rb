require 'rails_helper' 

RSpec.describe 'deparment index page' do
  before(:each) do
    @dept1 = Department.create!(name: 'Interior', floor: '10')
    @emp1 = @dept1.employees.create!(name: 'John Smith', level: 3)
    @emp2 = @dept1.employees.create!(name: 'John Doe', level: 32)
    @emp3 = @dept1.employees.create!(name: 'John Wick', level: 100)

    @dept2 = Department.create!(name: 'Muggle Affairs', floor: '9 and 3/4')
    @emp4 = @dept2.employees.create!(name: 'Author Weasley', level: 42)
    @emp5 = @dept2.employees.create!(name: 'Jack Johnson', level: 1)
  end

  it 'lists each department name and floor and all employees' do
    visit '/departments'

    within("div#dept_id#{@dept1.id}") do
      expect(page).to have_content(@dept1.name)
      expect(page).to have_content(@dept1.floor)
      expect(@dept1.name).to appear_before(@emp1.name)
      expect(page).to have_content(@emp2.name)
      expect(page).to have_content(@emp3.name)
    end

    within("div#dept_id#{@dept2.id}") do
      expect(page).to have_content(@dept2.name)
      expect(page).to have_content(@dept2.floor)
      expect(@dept2.name).to appear_before(@emp4.name)
      expect(page).to have_content(@emp5.name)
    end
  end
end

