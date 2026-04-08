class ReportsController < ApplicationController
  def index
    @report = Report.find_by(id:params[:id])
    if params[:latest]
      @reports = Report.latest
    elsif params[:old]
      @reports = Report.old
    else
      @reports = Report.all
    end
  end
  
  def show
    @report = Report.find_by(id:params[:id])
  end
  
  def new
   @id = params[:id]
  end

  def create
    
    @report = Report.new(
      classDate: params[:classDate],
      classTime: params[:classTime],
      classSubject: params[:classSubject],
      classContent: params[:classContent],
      classHomework: params[:classHomework],
      classComment: params[:classComment],
      done: params[:done]
      )
    @report.save
    redirect_to("/reports/index")
  end


  def edit
    @reports = Report.all
    @report = Report.find_by(id: params[:id])
    
  end

 

  def update
    @report = Report.find_by(id: params[:id])
    @report.classDate = params[:classDate]
    @report.classTime = params[:classTime]
    @report.classSubject = params[:classSubject]
    @report.classContent = params[:classContent]
    @report.classHomework = params[:classHomework]
    @report.classComment = params[:classComment]
    
    if @report.save
      redirect_to("/reports/index")
    else
      render("report/edit")
    end

  end

  def destroy
    @report = Report.find_by(id: params[:id])
    @report.destroy
    redirect_to ("/reports/index")
  end
end
