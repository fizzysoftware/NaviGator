class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [ :welcome ]
  before_filter :load_user

  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_bars_path( current_user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def welcome
  end

  #  ===================
  #  = Private Methods =
  #  ===================
  private

  def load_user
    if action_name != "welcome"
      @user = User.find( params[:id] )
      ensure_current_user( @user )
    end
  end

end
