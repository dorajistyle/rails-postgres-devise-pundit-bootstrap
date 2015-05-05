class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
  
  # def self.policy_class
  #   UserPolicy
  # end
  
  def index
    @user = current_user
    if @user.nil?
      redirect_to root_path
    else
      authorize @user    
    end
    
    @users = User.order(:id).page params[:page]
  end
  
  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end
  
  # GET /users/:id/edit
  def edit
    authorize @user
    # authorize! :update, @user
  end
  
  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    authorize @user
    respond_to do |format|
      @user.skip_reconfirmation!
      if @user.update(user_role_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    puts "finish signup started"
    if request.patch? && params[:user] #&& params[:user][:email]
      # puts user_params
      
      puts "finish signup patch param"
      puts user_params
      # When you want to confirm email, commenting below line.
      @user.skip_reconfirmation!
      if @user.update(user_params)
        puts "finish signup updated"
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end
  
  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to :controller => 'users', :action => 'index' }
      format.json { head :no_content }
    end
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
  
  def user_role_params
    accessible = [ :role ] # extend with your own params
    params.require(:user).permit(accessible)
  end
  
  
end
