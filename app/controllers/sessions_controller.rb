class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.find_all_by_org_id(params[:org_id])
 		@sessions_by_date = @sessions.group_by(&:class_date)
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
		if params[:session][:class_to_date]
			date_range = (params[:session][:class_date]..params[:session][:class_to_date]).to_a
			date_range.each do |r|
				params[:session][:class_date] = r
				@session = Session.new(params[:session])
				@session.org_id = params[:org][:org_id]
				@session.save
			end
		else
			params[:session][:class_date]
      @session = Session.new(params[:session])
      @session.org_id = params[:org][:org_id]
      @session.save
		end
    respond_to do |format|
      if @session.save
        format.html { redirect_to sessions_path, notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
      else
        format.html { render action: "new" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end

	def wintas
		puts "made it to wintas"
	end
end
