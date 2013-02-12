class BarsController < ApplicationController
  before_filter :authenticate_user!, except: [:fizzybar, :hit] # , :get_fizzybar
  before_filter :populate_resources

  # GET /bars
  def index
    @bars = @user.bars
    @days = ( params[:days] || 30 ).to_i
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  def show
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars
  def create
    @bar = @user.bars.new( params[:bar] )

    if @bar.save
     redirect_to  user_bar_path( @user, @bar ), notice: 'Bar was successfully created.'
   else
     render action: "new"
   end
 end

  # PUT /bars/1
  def update

    if @bar.update_attributes( params[:bar] )
     redirect_to user_bar_path( @user, @bar), notice: 'Bar was successfully updated.'
   else
     render action: "edit"
   end
 end

  # return fizzybar. The HTML code for requesting application
  def fizzybar
    session[:visited] = true if session[:visited].blank?
    _visitor = @bar.visitors.within_week.find_or_create_by_session_id( session[:session_id] )
    _visitor.touch
  end

  #increments a hit for the given bar
  def hit
    @visitor = @bar.visitors.within_week.find_by_session_id!( session[:session_id] )
    @visitor.increment!(:hits)
    cookies[ "fizzybar_#{ @bar.id }"] = 1
    render js: ""
  end

  # return Embedding code
  def embed_code
    @bar = current_user.bars.find( params[:id] )
  end

  #  ===================
  #  = Private methods =
  #  ===================
  private

  def populate_resources
    if params[:uid].present?
      @user = User.find( params[:uid] )
    else
      @user = User.find( params[:user_id] )
      ensure_current_user( @user )
    end
    @bar  = @user.bars.find( params[:id]) if params[:id].present?
  end

end
