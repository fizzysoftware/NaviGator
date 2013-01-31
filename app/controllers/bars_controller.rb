class BarsController < ApplicationController
  before_filter :authenticate_user!, except: [:fizzybar, :get_fizzybar, :hit]

  # GET /bars
  # GET /bars.json
  def index
    if request.xhr?
      # debugger
      true
    else
      @bars = current_user.bars
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.json { render json: @bars }
    end
  end

  # GET /bars/new
  # GET /bars/new.json
  def new
    @bar = Bar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bar }
    end
  end

  # GET /bars/1/edit
  def edit
    @bar = current_user.bars.find(params[:id])
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = current_user.bars.new(params[:bar])

    respond_to do |format|
      if @bar.save
        format.html { redirect_to edit_bar_path( @bar ), notice: 'Bar was successfully created.' }
        format.json { render json: @bar, status: :created, location: @bar }
      else
        format.html { render action: "new" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bars/1
  # PUT /bars/1.json
  def update
    @bar = current_user.bars.find(params[:id])

    respond_to do |format|
      if @bar.update_attributes(params[:bar])
        format.html { redirect_to edit_bar_path( @bar ), notice: 'Bar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar = current_user.bars.find(params[:id])
    @bar.destroy

    respond_to do |format|
      format.html { redirect_to bars_url }
      format.json { head :no_content }
    end
  end

  # return Embedding code
  def embed_code
    @bar = current_user.bars.find( params[:id])
  end

  # return fizzybar.js requested from other applications
  def fizzybar
    respond_to do |format|
      format.html { redirect_to bars_url }
      format.js
    end
  end

  # return fizzybar. The HTML code for requesting application
  def get_fizzybar
    populate_resources
    session[:visited] = true if session[:visited].blank?
    @bar.visitors.find_or_create_by_session_id!( session[:session_id] )
  end

  def hit
    populate_resources
    @visitor = @bar.visitors.find_by_session_id!( session[:session_id] )
    @visitor.increment!( :hits )
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

# GET /bars/1
# GET /bars/1.json
# def show
#   @bar = Bar.find(params[:id])

#   respond_to do |format|
#     format.html # show.html.erb
#     format.json { render json: @bar }
#   end
# end
