class EmployeeTicketsController < ApplicationController
  def create
    EmployeeTicket.create(employee_ticket_params)
    redirect_to "/employees/#{params[:employee_id]}"
  end

  private

  def employee_ticket_params
    params.permit(:employee_id, :ticket_id)
  end
end