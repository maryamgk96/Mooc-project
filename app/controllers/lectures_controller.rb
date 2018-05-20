class LecturesController < InheritedResources::Base
  load_and_authorize_resource 
  
  
  def show
    @lecture= Lecture.find(params[:id])
    if current_user
    @new_comment = Comment.build_from(@lecture, current_user.id, "")
    end
  end
  def like
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_by current_user
    render layout: false
  end
  def unlike
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_from current_user
    render layout: false
  end
  def spam
    @lecture = Lecture.find(params[:id])
    @lecture.spam!(current_user)
    redirect_to lecture_path(@lecture )
  end
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id, :title )
    end

    

    
end

