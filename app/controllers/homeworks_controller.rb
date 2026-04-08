class HomeworksController < ApplicationController
    def index
        @reports = Report.all
        @report = Report.find_by(id:params[:id])
        
    end

    def show
        @report = Report.find_by(id:params[:id])
    end

    def done
        @report = Report.find_by(id:params[:id])
        @report.done = params[:done]
        if @report.save
            redirect_to ("/homeworks/index")
        else
            render("homeworks/:id/show")
        end
       
        
    end


end
