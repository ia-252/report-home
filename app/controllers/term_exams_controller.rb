class TermExamsController < ApplicationController
    def index
        
        @exams = Exam.all
        @exam = Exam.find_by(id:params[:id])
        if params[:grade_1]
            @exams = Exam.where(grade: 1)
        elsif params[:grade_2]
            @exams = Exam.where(grade: 2)
        elsif params[:grade_3]
            @exams = Exam.where(grade: 3)
        elsif params[:gradeAll]
            @exams =  Exam.gradeAll
        elsif params[:termAll]
            @exams =  Exam.termAll
        elsif params[:firstHalf]
            @exams = Exam.where(term: '前期')
        elsif params[:secondHalf]
            @exams = Exam.where(term: '後期')
        elsif params[:firstSemester]
            @exams = Exam.where(term: '1学期')
        elsif params[:secondSemester]
            @exams = Exam.where(term: '2学期')
        elsif params[:thirdSemester]
            @exams = Exam.where(term: '3学期')
        elsif params[:examTypeAll]
            @exams =  Exam.examTypeAll
        elsif params[:midterm]
            @exams = Exam.where(examType: '中間')
        elsif params[:final]
            @exams = Exam.where(examType: '期末')
        elsif params[:standardized]
            @exams = Exam.where(examType: '実力')
        elsif params[:subjectAll]
            @exams = Exam.subjectAll
        elsif params[:english]
            @exams = Exam.where(subject: '英語')
        elsif params[:ce_1]
            @exams = Exam.where(subject: 'コミュニケーション英語Ⅰ')
        elsif params[:ce_2]
            @exams = Exam.where(subject: 'コミュニケーション英語Ⅱ')
        elsif params[:ce_3]
            @exams = Exam.where(subject: 'コミュニケーション英語Ⅲ')
        elsif params[:le_1]
            @exams = Exam.where(subject: '論理・表現Ⅰ')
        elsif params[:le_2]
            @exams = Exam.where(subject: '論理・表現Ⅱ')
        elsif params[:le_3]
            @exams = Exam.where(subject: '論理・表現Ⅲ')
        elsif params[:japanese]
            @exams = Exam.where(subject: '国語')
        elsif params[:mj]
            @exams = Exam.where(subject: '現代文')
        elsif params[:oj]
            @exams = Exam.where(subject: '古文')
        elsif params[:oc]
            @exams = Exam.where(subject: '漢文')
        elsif params[:math]
            @exams = Exam.where(subject: '数学')
        elsif params[:aljebra]
            @exams = Exam.where(subject: '代数')
        elsif params[:geometry]
            @exams = Exam.where(subject: '幾何')
        elsif params[:m_1]
            @exams = Exam.where(subject: '数学Ⅰ')
        elsif params[:m_2]
            @exams = Exam.where(subject: '数学Ⅱ')
        elsif params[:m_3]
            @exams = Exam.where(subject: '数学Ⅲ')
        elsif params[:m_a]
            @exams = Exam.where(subject: '数学A')
        elsif params[:m_b]
            @exams = Exam.where(subject: '数学B')
        elsif params[:m_c]
            @exams = Exam.where(subject: '数学C')
        elsif params[:m_1a]
            @exams = Exam.where(subject: '数学Ⅰ・A')
        elsif params[:m_2b]
            @exams = Exam.where(subject: '数学Ⅱ・B')
        elsif params[:m_3c]
            @exams = Exam.where(subject: '数学Ⅲ・C')
        elsif params[:ss]
            @exams = Exam.where(subject: '社会')
        elsif params[:jh_a]
            @exams = Exam.where(subject: '日本史A')
        elsif params[:jh_b]
            @exams = Exam.where(subject: '日本史B')
        elsif params[:wh_a]
            @exams = Exam.where(subject: '世界史A')
        elsif params[:wh_b]
            @exams = Exam.where(subject: '世界史B')
        elsif params[:g_a]
            @exams = Exam.where(subject: '地理A')
        elsif params[:g_b]
            @exams = Exam.where(subject: '地理B')
        elsif params[:ethics]
            @exams = Exam.where(subject: '倫理')
        elsif params[:politics]
            @exams = Exam.where(subject: '政治・経済')
        elsif params[:ep]
            @exams = Exam.where(subject: '倫理・政経')
        elsif params[:sc]
            @exams = Exam.where(subject: '理科')
        elsif params[:cb]
            @exams = Exam.where(subject: '化学基礎')
        elsif params[:chemistry]
            @exams = Exam.where(subject: '化学')
        elsif params[:bb]
            @exams = Exam.where(subject: '生物基礎')
        elsif params[:biology]
            @exams = Exam.where(subject: '生物')
        elsif params[:pb]
            @exams = Exam.where(subject: '物理基礎')
        elsif params[:physics]
            @exams = Exam.where(subject: '物理')
        elsif params[:gb]
            @exams = Exam.where(subject: '地学基礎')
        elsif params[:giology]
            @exams = Exam.where(subject: '地学')
        elsif params[:informatics]
            @exams = Exam.where(subject: '情報')
        elsif params[:music]
            @exams = Exam.where(subject: '音楽')
        elsif params[:he]
            @exams = Exam.where(subjecte: '家庭科')
        else params[:pe]
            @exams = Exam.where(subject: '保健・体育')
        end
    end

    def new
       
    end

    def create
        @exam = Exam.new(
            grade: params[:grade],
            term: params[:term],
            examType: params[:examType],
            subject: params[:subject],
            goal: params[:goal],
            result: params[:result],
            )
        if @exam.save
            redirect_to("/term_exams/index")
        else render("term_exams/new")
        end
    end

    def edit
        @exams = Exam.all
        @exam = Exam.find_by(id: params[:id])
    end
    
    def update
        @exam = Exam.find_by(id: params[:id])
        
        @exam.grade = params[:grade]
        @exam.term = params[:term],
        @exam.examType = params[:examType],
        @exam.subject = params[:subject],
        @exam.goal = params[:goal],
        @exam.result = params[:result],
        if @exam.save
          redirect_to("/term_exams/index")
        else
          render("term_exams/edit")
        end
    
    end

    def destroy
        @exam = Exam.find_by(id: params[:id])
        @exam.destroy
        redirect_to ("/term_exams/index")
    end


end
