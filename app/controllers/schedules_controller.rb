class SchedulesController < ApplicationController
    def index
        @reports = Report.all
        @report = Report.find_by(id: params[:id])
    end

    def edit
        @reports = Report.all
        @report = Report.find_by(id: params[:id])
        
    end

end
