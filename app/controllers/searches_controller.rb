class SearchesController < ApplicationController

  before_filter :authenticate_user!

  # GET /searches
  # GET /searches.json
  def index
    @contacts = Contact.all
    @calltypes = CallType.all
    @users = User.where( :group_id => '2' )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/patient
  def patient
    @results = Call.where( :contact_id => params[:uid] )

    respond_to do |format|
      format.html # patient.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/type
  def type
    @results = Call.where( :call_type_id => params[:uid] )

    respond_to do |format|
      format.html # type.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/rep
  def rep
    @results = Call.where( :user_id => params[:uid] )

    respond_to do |format|
      format.html # type.html.erb
      format.json { render json: @results }
    end
  end

  # POST /searches/date
  def date
    @srch_date_start = Date.civil(params[:search_date][:year].to_i, params[:search_date][:month].to_i, params[:search_date][:day].to_i)
    @srch_date_end = Date.civil(params[:search_date][:year].to_i, params[:search_date][:month].to_i, params[:search_date][:day].to_i + 1)
    @results = Call.where( :call_start => ( @srch_date_start..@srch_date_end ) )

    respond_to do |format|
      format.html # type.html.erb
      format.json { render json: @results }
    end
  end


  # GET /searches/results
  def results
    if params[:s] == "contact"
      @results = Call.where( :contact_id => params[:uid] )
    elsif params[:s] == "type"
      @results = Call.where( :call_type_id => params[:uid] )
    elsif params[:s] == "date"
      @results = Call.where( )
    elsif params[:s] == "rep"
      @results = Call.where( :user_id => params[:uid] )
    end

    respond_to do |format|
      format.html # results.html.erb
      format.json { render json: @results }
    end
  end

end
