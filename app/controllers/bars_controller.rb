class BarsController < ApplicationController
  before_filter :authenticate_user!, except: [:fizzybar, :hit] # , :get_fizzybar

  # GET /bars
  def index
    @bars = current_user.bars
    @days = ( params[:days] || 30 ).to_i
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  def show
    @bar = current_user.bars.find( params[:id] )
  end

  # GET /bars/1/edit
  def edit
    @bar = current_user.bars.find( params[:id] )
  end

  # POST /bars
  def create
    @bar = current_user.bars.new( params[:bar] )

    if @bar.save
     redirect_to  user_bar_path( current_user, @bar ), notice: 'Bar was successfully created.'
   else
     render action: "new"
   end
 end

  # PUT /bars/1
  def update
    @bar = current_user.bars.find( params[:id] )

    if @bar.update_attributes( params[:bar] )
     redirect_to user_bar_path( current_user, @bar), notice: 'Bar was successfully updated.'
   else
     render action: "edit"
   end
 end

  # return fizzybar. The HTML code for requesting application
  def fizzybar
    populate_resources
    session[:visited] = true if session[:visited].blank?
    _visitor = @bar.visitors.within_week.find_or_create_by_session_id( session[:session_id] )
    _visitor.touch
  end

  #increments a hit for the given bar
  def hit
    populate_resources
    @visitor = @bar.visitors.within_week.find_by_session_id!( session[:session_id] )
    @visitor.increment!(:hits)
    cookies[ "fizzybar_#{ @bar.id }"] = 1
    render js: ""
  end

  #  ===================
  #  = Private methods =
  #  ===================
  private

  def populate_resources
    @user = User.find( params[:uid] )
    @bar  = @user.bars.find( params[:bar] )
  end

end
