class UsersService
  def initialize(params)
    @email = params[:email]
  end
  
  def check_email
    begin
      email_check_service
    rescue
      false
    end
  end
  
  private
  
  attr_reader :email
  
  def email_check_service
  end
end
