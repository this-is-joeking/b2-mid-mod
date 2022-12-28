# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@dept1 = Department.create!(name: 'Interior', floor: '10')
@emp1 = @dept1.employees.create!(name: 'John Smith', level: 3)
@emp2 = @dept1.employees.create!(name: 'John Doe', level: 32)
@emp3 = @dept1.employees.create!(name: 'John Wick', level: 100)

@dept2 = Department.create!(name: 'Muggle Affairs', floor: '9 and 3/4')
@emp4 = @dept2.employees.create!(name: 'Author Weasley', level: 42)
@emp5 = @dept2.employees.create!(name: 'Jack Johnson', level: 1)

@ticket1 = @emp1.tickets.create!(subject: 'broken faucet', age: 2)
@ticket2 = @emp1.tickets.create!(subject: 'torn carpet', age: 9)
@ticket3 = @emp1.tickets.create!(subject: 'bug infestation', age: 6)
@ticket4 = @emp2.tickets.create!(subject: 'leaky pipe', age: 4)

