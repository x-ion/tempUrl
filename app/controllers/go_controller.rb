class GoController < ApplicationController
  def index
  	#@randomUrl = Url.new
  end

  def show
  	 @url = Url.find_by_alias(params[:alias])
    if @url
      redirect_to(@url[:http])
    else
      respond_to do |format|
      format.html { redirect_to new_url_url, notice: 'This Alias Was Not Found. Create A New One?' }
      format.json { render :show, status: :created, location: @url }
      end
    end 
  end

  def create
  	@randomUrl = params[:randomUrl]
  	key = (('a'..'z').to_a + ('0'..'9').to_a + ('A'..'Z').to_a).to_a.shuffle[1..7].join
  	@url = Url.new(
  		alias: key,
  		http: @randomUrl[:http]
  		)

  	respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end

  end

end
