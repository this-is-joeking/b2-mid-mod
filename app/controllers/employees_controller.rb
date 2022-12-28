class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:employee_id])
    @department = @employee.department
    @tickets = @employee.tickets.oldest_to_youngest
    @oldest_ticket = @tickets.first
  end
end